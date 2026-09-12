BUILD_DIR := build

ifeq ($(OS),Windows_NT)
    # Batch
    PYTHON := py
    MKDIR := if not exist "$(BUILD_DIR)" mkdir "$(BUILD_DIR)"
    DELETE := if exist "$(BUILD_DIR)" rmdir /s /q "$(BUILD_DIR)"
    COPY_F = copy /Y "$(1)" "$(BUILD_DIR)" >nul
    COPY_R = robocopy "$(1)" "$(BUILD_DIR)\$(1)" /MIR /NFL /NDL /NJH /NJS | findstr /v "^$$" || rem
    TIME := %time:~0,8%
else
    # POSIX
    PYTHON := python
    MKDIR := mkdir -p $(BUILD_DIR)
    DELETE := rm -rf $(BUILD_DIR)
    COPY_F = cp $(1) $(BUILD_DIR)/
    COPY_R = rsync -a --delete $(1)/ $(BUILD_DIR)/$(1)/
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
	$(MKDIR)
	$(call COPY_R,datapacks)
	$(call COPY_R,data)
	$(call COPY_F,challengemode_trainers.xlsx)
	$(call COPY_F,process_files.py)

clean:
	$(DELETE)

revert: # if process_files was run in the repo
	git restore datapacks/CobblemonJohto/data/cobblemon/dialogues/interactions/
	git restore datapacks/CobblemonJohto/data/cobblemon/npcs/trainers/
	git clean -fd data/molang/challengemode_trainers/

.PHONY: all copy clean revert