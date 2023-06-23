extends Node2D
class_name TypingGame

# Variables

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
#	'1', '2', '3', '4',  '5', '6',  '7', '8',  '9', '0', 
]

# Functions

## Game
func initialize_typing_game(word:String):
	
func on_input(input):
	pass

## Letter
func on_letter_pressed(letter:String):
	pass

## Words

## Sentences
