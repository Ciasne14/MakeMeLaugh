extends PanelContainer

@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

func _ready() -> void:
	global_state.is_leaderboard_from_main_menu = false
	%Points.text = "Punkty: " + str(global_state.points)

func _on_player_name_text_submitted(new_text):
	global_state.player_name = %PlayerName.text
	print("PlayerName set ", global_state.player_name)
