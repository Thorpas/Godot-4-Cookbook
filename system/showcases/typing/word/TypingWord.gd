extends Node
class_name TypingWord

signal results_changed
signal word_complete

# Varaibles
var _word:String = "Word"
var _position:int = 0
var _results:Array = []
## Whitelist of accepted chars.
const WHITELIST:Array = [
	'A', 'a',
	'B', 'b',
	'C', 'c',
	'D', 'd',
	'E', 'e',
	'F', 'f',
	'G', 'g',
	'H', 'h',
	'I', 'i',
	'J', 'j',
	'K', 'k',
	'L', 'l',
	'M', 'm',
	'N', 'n',
	'O', 'o',
	'P', 'p',
	'Q', 'q',
	'R', 'r',
	'S', 's',
	'T', 't',
	'U', 'u',
	'V', 'v',
	'W', 'w',
	'X', 'x',
	'Y', 'y',
	'Z', 'z',
	'space',
]

# Functions

## Word
func initialize_typing_word(word:String):
	_word = word
	_position = 0

## Character
func get_character_position()->int:
	return _position
func _get_character_at(position:int)->String:
	return _word.substr(position, 1)

func try_character(character:String):
	if not character in WHITELIST:
		return
	if (_results.size() - 1) < _position:
		_results.append(null)
	if _check_character(character):
		_results[_position] = "green"
		_position += 1
	else:
		_results[_position] = "red"
	if _position == _word.length():
		emit_signal("word_complete")
	else:
		print("Emit results_changed")
		emit_signal("results_changed")
func _check_character(character:String)->bool:
	return _word[_position] == character

func get_results()->Array:
	return _results

func get_word()->String:
	return _word

func disconnect_word_signals(object):
	pass
func connect_word_signals(object):
	results_changed.connect(object._on_word_results_changed)
	word_complete.connect(object._on_word_completed)
