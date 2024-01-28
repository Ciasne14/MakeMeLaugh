extends Node2D


@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

func _input(event: InputEvent):
	if event.is_action_pressed("escape"):
		global_state._ready()
		get_tree().change_scene_to_file("res://main_manu.tscn")

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	var new_mob_dziecko = preload("res://mob_dziecko.tscn").instantiate()
	var new_mob_feministka = preload("res://mob_feminiska.tscn").instantiate()
	var new_braun = preload("res://mob_braun.tscn").instantiate()
	var rng = RandomNumberGenerator.new()
	var my_random_number = round(rng.randf_range(0, 10.0))
	if(my_random_number<1):
		new_mob = new_braun
	elif (my_random_number<4):
		new_mob = new_mob_dziecko
	elif (my_random_number<7):
		new_mob = new_mob_feministka
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	#get_tree().paused = true


func _on_seconds_left_timeout():
	global_state.seconds_left -= 1
	%TimeLeftLabel.text = "Zostało: " + str(global_state.seconds_left) + "sec"
