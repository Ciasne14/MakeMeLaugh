extends CharacterBody2D

var health = 3
var wordToSpawn = preload("res://word.tscn")
@onready var player = get_node("/root/Game/Player")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()


func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		randomly_spawn_word()
		queue_free()
		const  SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position

func randomly_spawn_word():
	var rng = RandomNumberGenerator.new()
	var random = rng.randf_range(0, 10.0) 
	if(random < 10):
		var instantiated_word = wordToSpawn.instantiate()
		get_parent().add_child(instantiated_word)
		instantiated_word.position = position
