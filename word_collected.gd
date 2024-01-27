extends Label

@onready var game_manager: GameManager = get_node("/root/Game/GameManager")
@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

func _ready():
	text = "Zebrane frazy: " + str(game_manager.words_count) + "/" + str(global_state.current_words.size())
	
func _on_game_manager_word_collected(count):
	text = "Zebrane frazy: " + str(game_manager.words_count) + "/" + str(global_state.current_words.size())
	if (game_manager.words_count >= global_state.current_words.size()):
		text = "Czas na bossa"
