extends Label

@onready var game_manager: GameManager = get_node("/root/Game/GameManager")

func _on_game_manager_word_collected(count):
	text = str(game_manager.words_count)
