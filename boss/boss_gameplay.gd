extends PanelContainer

@onready var drop_target = %TargetContainer
@onready var draggable_scene = preload("res://boss/draggable_word.tscn")
@onready var draggable_container = %SourceContainer
@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

var matched_words: Array = []

@onready var czernobyl = preload("res://czernobyl.jpg")
@onready var rowerek = preload("res://rowerek.jpg")
@onready var wiesza = preload("res://wiesza.jpg")
@onready var dziadek = preload("res://dziadek.jpg")
@onready var nogi = preload("res://nogi.jpg")

func _ready() -> void:
	_populate_dragables()
	%Points.text = "Punkty: " + str(global_state.points)
	if global_state.current_words[1] == "dzieci":
		$VBoxContainer/SomeImage/jokeBackground.texture = czernobyl
	if global_state.current_words[1] == "poznać":
		$VBoxContainer/SomeImage/jokeBackground.texture = wiesza
	if global_state.current_words[1] == "Ania":
		$VBoxContainer/SomeImage/jokeBackground.texture = rowerek
	if global_state.current_words[1] == "robią":
		$VBoxContainer/SomeImage/jokeBackground.texture = dziadek
	if global_state.current_words[1] == "zrobić":
		$VBoxContainer/SomeImage/jokeBackground.texture = nogi

func _populate_dragables():
	var words_created: Array = []
	for index in range(global_state.current_words.size()):
		var drag_item = draggable_scene.instantiate()
		drag_item.id = index
		drag_item.label = global_state.current_words[index]
		drag_item.word_clicked.connect(_on_drag_item_clicked)
		words_created.push_back(drag_item)
	words_created.shuffle()
	for drag_item in words_created:
		draggable_container.add_child(drag_item)

func _on_item_dropped_on_target(dropped_item: DraggableWord) -> void:
	for drag_item in draggable_container.get_children():
		drag_item = (drag_item as DraggableWord)
		if drag_item.id == dropped_item.id:
			draggable_container.remove_child(drag_item)
			drag_item.queue_free()
			if matched_words.size() == global_state.current_words.size():
				_matched_all()
			break

func _on_drag_item_clicked(dropped_item: DraggableWord) -> void:
	if dropped_item.id == 0 && matched_words.size() == 0:
		global_state.points += 20
		_move_word(dropped_item)
		return
	var last_matched_word = matched_words.back()
	if last_matched_word == null || last_matched_word["id"] + 1 != dropped_item.id:
		global_state.points -= 5
	else:
		global_state.points += 20
		_move_word(dropped_item)
	print("Points ", str(global_state.points))
	%Points.text = "Punkty: " + str(global_state.points)
	

func _move_word(item: DraggableWord) -> void:
	matched_words.push_back({
		"id": item.id,
		"label": item.label 
	})
	%DropWords.word_clicked(item)
	
func _matched_all():
	var initial_index = 0
	for word in matched_words:
		if word["id"] != initial_index:
			print("Wrong word chuju!", word["label"], word["id"], " ", initial_index)
		initial_index += 1
	get_tree().change_scene_to_file("res://summary.tscn")
	
