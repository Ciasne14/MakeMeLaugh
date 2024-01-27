extends MarginContainer

var player_name: String
var points: int

func _ready():
	%PlayerName.text = player_name
	%Points.text = str(points)
