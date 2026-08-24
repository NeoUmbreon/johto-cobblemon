BUILD_DIR := build

all: copy
	cd $(BUILD_DIR) && python process_files.py

copy: clean
	mkdir -p $(BUILD_DIR)
	cp -r datapacks data process_files.py challengemode_trainers.xlsx $(BUILD_DIR)/

clean:
	rm -rf $(BUILD_DIR)

revert: # if process_files was run in the repo
	git restore datapacks/CobblemonJohto/data/cobblemon/dialogues/interactions/
	git restore datapacks/CobblemonJohto/data/cobblemon/npcs/trainers/
	git clean -fd data/molang/challengemode_trainers/

.PHONY: all copy clean revert