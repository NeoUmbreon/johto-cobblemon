BUILD_DIR := build
DATA_DIR := $(BUILD_DIR)/data/molang

ifeq ($(OS),Windows_NT)
    # Batch
    PYTHON := py
    MKDIR = if not exist "$(1)" mkdir "$(1)"
    DELETE = if exist "$(1)" rmdir /s /q "$(1)"
    COPY_F = copy /Y "$(subst /,\,$(1))" "$(2)" >nul
    COPY_R = robocopy "$(1)" "$(2)\$(1)" /MIR /NFL /NDL /NJH /NJS | findstr /v "^$$" || rem
    COPY_IF_MISSING = if not exist "$(2)" copy /Y "$(subst /,\,$(1))" "$(2)" >nul
    TIME := %time:~0,8%
else
    # POSIX
    PYTHON := python
    MKDIR = mkdir -p $(1)
    DELETE = rm -rf $(1)
    COPY_F = cp $(1) $(2)/
    COPY_R = rsync -a --delete $(1)/ $(2)/$(1)/
    COPY_IF_MISSING = test -f $(2) || cp $(1) $(2)
    TIME := $$(date +%H:%M:%S)
endif

ECHO_START := @echo === Build started at $(TIME) ===
ECHO_END := @echo === Build completed at $(TIME) ===

all:
	$(ECHO_START)
	@$(MAKE) --no-print-directory copy
	cd $(BUILD_DIR) && $(PYTHON) process_files.py
	$(ECHO_END)

copy:
	$(call MKDIR,$(BUILD_DIR))
	$(call COPY_R,datapacks,$(BUILD_DIR))
	$(call COPY_F,challengemode_trainers.xlsx,$(BUILD_DIR))
	$(call COPY_F,process_files.py,$(BUILD_DIR))
	$(call COPY_R,data/molang/battle_frontier,$(BUILD_DIR))
	$(call COPY_F,data/molang/trainers.json,$(DATA_DIR))
	$(call COPY_IF_MISSING,data/molang/config.json,$(DATA_DIR)/config.json)

clean:
	$(call DELETE,$(BUILD_DIR))

revert: # if process_files was run in the repo
	git restore datapacks/CobblemonJohto/data/cobblemon/dialogues/interactions/
	git restore datapacks/CobblemonJohto/data/cobblemon/npcs/trainers/
	git clean -fd data/molang/challengemode_trainers/

.PHONY: all copy clean revert