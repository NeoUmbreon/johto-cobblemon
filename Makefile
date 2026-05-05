normal:
	ENABLE_CHALLENGE_MODE=false python process_files.py

challenge:
	ENABLE_CHALLENGE_MODE=true python process_files.py

clean:
	git restore datapacks/CobblemonJohto/data/cobblemon/dialogues/interactions/
	git restore datapacks/CobblemonJohto/data/cobblemon/npcs/trainers/
	git clean -fd datapacks/CobblemonJohto/data/cobblemon/npcs/trainers/silver/
	git restore datapacks/CobblemonJohto/data/cobblemon/dialogues/battle_ends/
	git clean -fd trainers/
	git clean -fd datapacks/CobblemonJohto/data/cobblemon/dialogues/battle_ends/
	git clean -fd datapacks.zip
	git clean -fd trainers.zip

.PHONY: normal challenge clean
