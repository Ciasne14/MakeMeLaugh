extends MarginContainer

class_name DraggableWord

var id: int
var label: String

var dropped_on_target: bool = false

func _read() -> void:
	add_to_group("DRAGGABLE")
	%Label.text = label

func set_text(text: String) -> void:
	label = text
	%Label.text = text
	
func _get_drag_data(_position: Vector2):
	print("[DraggableWord] get_drag_data has run")
	if not dropped_on_target:
		set_drag_preview(_get_preview_control())
		return self

func _on_item_dropped_on_target(draggable):
	print("[DraggableWord] Signal item_dropped_on_target received")
	if draggable.get("id") != id:
		return
	print("[DraggableWord] Iven been dropped, removing myself from source container")
	queue_free()
		
func _get_preview_control() -> Control:
	"""
	The preview control must not be in the scene tree. You should not free the control, and
	you should not keep a reference to the control beyond the duration of the drag.
	It will be deleted automatically after the drag has ended.
	"""
	var preview = ColorRect.new()
	preview.size = %SuperColor.size
	var preview_color = %SuperColor.color
	preview_color.a = .5
	preview.color = preview_color
	preview.set_rotation(.1) # in readians
	return preview
