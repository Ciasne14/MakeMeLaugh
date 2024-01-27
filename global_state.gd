extends Node

class_name GlobalState

var jokes: Array = [
	"""Dlaczego dzieci z Czarnobyla są mądre? Bo co dwie głowy to nie jedna.""",
	"""Jak poznać prawdziwego programistę? Wiesza się razem ze swoim programem""",
	"""Dlaczego Ania nie płakała jak spadła z roweru? Bo kierownica jej płuco przebiła."""
]

var current_joke: String = ""
var current_words: Array = []
var words_to_collect: Array = []

var seconds_left: int = 300

var collected_wrods: Array = []

var points: int = 0
var player_name: String = ""

func _ready():
	current_joke = jokes.pick_random()
	current_joke = current_joke.trim_prefix(" ").trim_suffix(" ")
	current_words = current_joke.split(" ")
	words_to_collect = current_words.duplicate()
