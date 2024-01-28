extends PanelContainer

@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

func _ready():
	if global_state.is_leaderboard_from_main_menu:
		%Spacer.visible = true
		%AgainBtn.visible = false
	else:
		%Spacer.visible = false
		%AgainBtn.visible = true
	global_state.is_leaderboard_from_main_menu = true

