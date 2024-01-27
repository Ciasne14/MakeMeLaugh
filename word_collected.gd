extends Label

@onready var game_manager: GameManager = get_node("/root/Game/GameManager")
func _ready():
	text = "Zebrane frazy: " + str(game_manager.words_count) + "/" + str(game_manager.words_limit)
	
func _on_game_manager_word_collected(count):
	text = "Zebrane frazy: " + str(game_manager.words_count) + "/" + str(game_manager.words_limit)
	if(game_manager.words_count>=game_manager.words_limit):
		text = "Czas na bossa"
