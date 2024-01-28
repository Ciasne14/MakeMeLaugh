extends Button

@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

func _pressed():
	global_state._ready()
	global_state.points = 0
	get_tree().change_scene_to_file("res://survivors_game.tscn")

