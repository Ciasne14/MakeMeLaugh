extends Node

class_name GlobalState

var jokes: Array = [
	"""Dlaczego dzieci z Czarnobyla są mądre? Bo co dwie głowy to nie jedna."""
]

var current_joke: String = ""
var current_words: Array = []
var words_to_collect: Array = []

var collected_wrods: Array = []

func _ready():
	current_joke = jokes.pick_random()
	current_joke = current_joke.trim_prefix(" ").trim_suffix(" ")
	current_words = current_joke.split(" ")
	current_words.shuffle()
	words_to_collect = current_words.duplicate()
