extends CharacterBody2D

var health = 1
var wordToSpawn = preload("res://components/word.tscn")
@onready var player = get_node("/root/Game/Player")

@onready var game_manager: GameManager = get_node("/root/Game/GameManager")

func _ready():
	%Slime.play_walk()
	pass

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()


func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		spawn_word()
		$Puff.play()
		queue_free()
		const  SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		const  PUFF_SOUND = preload("res://puff_sound.tscn")
		var puff = PUFF_SOUND.instantiate()
		get_parent().add_child(puff)
		puff.global_position = global_position
		

func spawn_word():
	var word = game_manager.get_defined_word()
	if word == null:
		return
	word.position = position
	get_parent().add_child(word)
