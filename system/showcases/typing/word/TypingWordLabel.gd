extends RichTextLabel
class_name TypingWordLabel

# Variables
@export var preText:String = ""
@export var postText:String = ""
@export var fontSize:int = 27

var _word:TypingWord

# Functions

##
func initialize_typing_word_label(pretext:String, posttext:String, fontsize:int):
	pass

## Text
func _colorcode_text(word:String, colors:Array)->String:
	var _text:String = ""
	for _i in colors.size():
		_text += "[color=" + colors[_i] + "]" + word[_i] + "[/color]"
	_text += word.right(word.length() - colors.size())
	return _text

## Word
func set_typing_word(word:TypingWord):
	if _word != null:
		_remove_typing_word()
	_word = word
	add_child(_word)
	_word.connect_word_signals(self)
	set_text(_colorcode_text(_word.get_word(), _word.get_results()))
func _remove_typing_word():
	_word.disconnect_word_signals(self)
	remove_child(_word)
	_word = null
func _on_word_results_changed():
	print("Results Update")
	set_text(_colorcode_text(_word.get_word(), _word.get_results()))
func _on_word_completed():
	pass
func try_character(character:String):
	_word.try_character(character)
