extends PanelContainer
@onready var global_state: GlobalState = get_node("/root/GlobalStatee")
func _ready() -> void:
	$Points.text = "Punkty: " + str(global_state.points)
