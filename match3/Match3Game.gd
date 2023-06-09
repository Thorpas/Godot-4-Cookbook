extends Node2D
class_name Match3Game

# Functions

## Godot
func _ready():
	$Match3Grid.initialize_grid(5,5,[&"Blue",&"Gold",&"Red"])
func _on_return_button_up():
	get_tree().change_scene_to_packed(load("res://Start.tscn"))
