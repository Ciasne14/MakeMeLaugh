extends Area2D

var travelled_distance = 0
var valueRand = 1
@onready var DON = $Donkey
@onready var SYR = $Syringe
@onready var JAR = $Jar
@onready var CAN = $Cancer
@onready var STO = $Stone

func _ready():
	var don = $Donkey
	var syr = $Syringe
	var jar = $Jar
	var can = $Cancer
	var sto = $Stone
	var array = [don,syr,jar,can,sto]
	array.pick_random().visible = true
	
func _physics_process(delta):
	const  SPEED = 1000
	const  RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
