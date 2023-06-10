extends Node2D
class_name Match3Game

# Variables
var _scoreBlue:int = 0
var _scoreGreen:int = 0
var _scoreRed:int = 0

# Functions

## Godot
func _ready():
	$Match3Grid.initialize_grid(3,3,[&"Blue",&"Green",&"Red"])
	_update_score(0 ,0 ,0)
func _on_return_button_up():
	get_tree().change_scene_to_packed(load("res://Start.tscn"))

## Interface
### Selection
func _on_piece_selected(color, column, row):
	var _text:String = "[center][font_size=36]Selection\n"
	match color:
		&"Blue":
			_text += "[color=blue]C: " + str(column+1) + " - R: " + str(row+1) + "[/color]"
		&"Green":
			_text += "[color=green]C: " + str(column+1) + " - R: " + str(row+1) + "[/color]"
		&"Red":
			_text += "[color=red]C: " + str(column+1) + " - R: " + str(row+1) + "[/color]"
		_:
			_text += "None"
	_text += "[/font_size][/center]"
	$VBoxContainer/Selection.set_text(_text)
	
### Score
func _update_score(blue:int, green:int, red:int):
	_scoreBlue += blue
	_scoreGreen += green
	_scoreRed += red
	$VBoxContainer/Blue.set_text("[center][font_size=36][color=blue]" + str(_scoreBlue) + "[/color][/font_size][/center]")
	$VBoxContainer/Green.set_text("[center][font_size=36][color=green]" + str(_scoreGreen) + "[/color][/font_size][/center]")
	$VBoxContainer/Red.set_text("[center][font_size=36][color=red]" + str(_scoreRed) + "[/color][/font_size][/center]")
