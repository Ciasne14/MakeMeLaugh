extends Button

@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

func _pressed():
	#if %PlayerName.text != "":
		#global_state.player_name = %PlayerName.text
		#print("PlayerName set ", global_state.player_name)
	get_tree().change_scene_to_file("res://leaderboard/leaderboard.tscn")
