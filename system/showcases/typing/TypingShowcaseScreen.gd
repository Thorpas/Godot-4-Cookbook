extends ShowcaseScreen



# Functions

## Godot
func _ready():
	set_word("Cookbook")
	await transition_from_color(Color.BLACK, 0.5)
func _input(event):
	if event is InputEventKey and event.pressed:
		var _character:String = ""
		_character = OS.get_keycode_string(event.keycode)
		if not event.shift_pressed:
			_character = _character.to_lower()
		$InputLabel.set_text("[font_size=27]" + _character + "[/font_size]")
		$TypingWordLabel.try_character(_character)

func set_word(word:String):
	var _word:TypingWord = load("res://system/showcases/typing/word/TypingWord.tscn").instantiate()
	_word.initialize_typing_word(word)
	$TypingWordLabel.set_typing_word(_word)
