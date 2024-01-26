extends Node2D

func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		body.collected_words +=1
		queue_free()
