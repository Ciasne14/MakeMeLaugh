extends Node2D

class_name GameManager

signal word_used()
signal word_collected(count: int)

@onready var word_scene = preload("res://components/word.tscn")
@onready var global_state: GlobalState = get_node("/root/GlobalStatee")

var defined_words: Array = []
var words: Dictionary = {}
#var words_limit: int = 20
var words_count: int = 0

#var list_of_words = ["to chuj", "twoja stara", "mam jeszcze z osłem", "odpalaj", "rucham ci matkę","puk puk", "słoik pęka","sekator","chłop się za babę przebrał","kabarety xD","wilki jakieś","daj kamienia"]

#func define_words():
	#var examples = [
		#{
			#"word": "to chuj",
			#"weight": 10,
			#"category": "zydzi",
			#"word_position": 1
		#},
		#{
			#"word": "twoja stara",
			#"weight": 30,
			#"category": "ludzie",
			#"word_position": 1
		#},
	#]
	#for example in examples:
		#_define_word(example["word"], example["weight"], example["category"], example["word_position"])

#func _define_word(word_string: String, weight: int, category: String, word_position: int):
	#var word: Word = word_scene.instantiate()
	#word.word = word_string
	#word.weight = weight
	#word.category = category
	#word.word_position = word_position
	#word.set_text(word.word)
	#defined_words.push_back(word)

#func register_word(word: Word) -> void:
	#words[word.word] = Word

#func words_collected() -> Array:
	#return words.values().filter(func(word: Word): word.is_collected)

#func words_used() -> Array:
	#return words.values().filter(func(word: Word): word.is_used)

#func get_defined_word() -> Word:
	#print("Get Defined Word")
	#if randf_range(0, 10.0) < 10:
		#print("Word Returned")
		#return defined_words.pick_random()
	#return null

func word_collect():
	words_count += 1
	word_collected.emit(words_count)
	is_boss_ready()

func get_defined_word() -> Word:
	if global_state.words_to_collect.size() > 0 && randf_range(0, 10.0) < 10:
		var word: Word = word_scene.instantiate()
		var word_text: String = global_state.words_to_collect.pick_random()
		word.set_text(word_text)
		global_state.words_to_collect.remove_at(global_state.words_to_collect.find(word_text))
		
		return word
	return null

func is_boss_ready():
	if words_count >= global_state.current_words.size():
		get_tree().change_scene_to_file("res://boss_gameplay.tscn")
	
