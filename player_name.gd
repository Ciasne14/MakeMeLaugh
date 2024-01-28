extends TextEdit

func _input(event: InputEvent):
	if event.is_action_pressed("ui_accept") && self.has_focus():
		get_tree().set_input_as_handled()
