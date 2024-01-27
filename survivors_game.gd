extends Node2D


@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	var new_braun = preload("res://mob_braun.tscn").instantiate()
	var rng = RandomNumberGenerator.new()
	var my_random_number = round(rng.randf_range(0, 10.0))
	if(my_random_number>8):
		new_mob = new_braun
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true


func _on_seconds_left_timeout():
	global_state.seconds_left -= 1
	%TimeLeftLabel.text = "Zostało: " + str(global_state.seconds_left) + "sec"
