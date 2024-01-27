extends Node2D

class_name Word

@export_category("Word Properties")
@export var word: String
@export var weight: int
@export var category: String
@export var word_position: int

var is_used: bool
var is_collected: bool

@onready var game_manager: GameManager = get_node("/root/Game/GameManager")

#func _ready():
	#game_manager.register_word(self)

func set_text(text: String):
	var label: Label = get_node("Text")
	label.text = text
	%Collision.get_shape().size = label.size

func use():
	is_used = true
	game_manager.word_used.emit(self)

func collect():
	is_collected = true
	game_manager.word_collect()

func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		collect()
		queue_free()
