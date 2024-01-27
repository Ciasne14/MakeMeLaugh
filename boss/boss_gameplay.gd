extends PanelContainer

@onready var drop_target = %TargetContainer
@onready var draggable_scene = preload("res://boss/draggable_word.tscn")
@onready var draggable_container = %SourceContainer
@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

var matched_words: Array = []

func _ready() -> void:
	_populate_dragables()

func _populate_dragables():
	for index in range(global_state.current_words.size()):
		var drag_item = draggable_scene.instantiate()
		drag_item.id = index
		drag_item.set_text(global_state.current_words[index])
		draggable_container.add_child(drag_item)

func _on_item_dropped_on_target(dropped_item: DraggableWord) -> void:
	for drag_item in draggable_container.get_children():
		drag_item = (drag_item as DraggableWord)
		if drag_item.id == dropped_item.id:
			matched_words.push_back({
				"id": dropped_item.id,
				"label": dropped_item.label
			})
			draggable_container.remove_child(drag_item)
			drag_item.queue_free()
			if matched_words.size() == global_state.current_words.size():
				_matched_all()
			break

func _matched_all():
	var initial_index = 0
	for word in matched_words:
		if word["id"] == initial_index + 1:
			continue
		else:
			print("Wrong word chuju!", word["label"], word["id"])
		initial_index += 1
	
