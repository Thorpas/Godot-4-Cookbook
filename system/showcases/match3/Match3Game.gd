extends Node2D
class_name Match3Game

# Variables

## Initialization
@export_category("Match 3")
## Number of columns in the Match 3 Grid.
@export var columns:int = 10
## Number of rows in the Match 3 Grid.
@export var rows:int = 5
## Possible colors of Match 3 Pieces.
@export var colors:Array = [&"Blue",&"Green",&"Red"]

## Score
var _scoreBlue:int = 0
var _scoreGreen:int = 0
var _scoreRed:int = 0

# Functions

## Godot
func _ready():
	$Match3Grid.initialize_grid(columns, rows, colors)
	_update_score(0 ,0 ,0)

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
