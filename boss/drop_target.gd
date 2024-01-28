extends Panel

signal item_dropped_on_target(draggable)

@onready var draggable: PackedScene = preload("res://boss/draggable_word.tscn")
@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

#func _can_drop_data(position: Vector2, data) -> bool:
	#var can_drop: bool = data is DraggableWord
	#return can_drop

#func _drop_data(position: Vector2, data) -> void:
	#print("[DropWords] drop_data has run")
	#print("[DropWords] Emiting signal: item_dropped_on_target")
#
	#var draggable_copy: DraggableWord = draggable.instantiate()
	#draggable_copy.id = data.id
	#draggable_copy.set_text(data.label)
	#draggable_copy.dropped_on_target = true # diable furhter dragging
	#%TargetContainer.add_child(draggable_copy)
#
	#item_dropped_on_target.emit(data)

func word_clicked(data: DraggableWord) -> void:
	print("[DropWords] drop_data has run")
	print("[DropWords] Emiting signal: item_dropped_on_target")

	var draggable_copy: DraggableWord = draggable.instantiate()
	draggable_copy.id = data.id
	draggable_copy.set_text(data.label)
	draggable_copy.dropped_on_target = true # diable furhter dragging
	%TargetContainer.add_child(draggable_copy)

	item_dropped_on_target.emit(data)
