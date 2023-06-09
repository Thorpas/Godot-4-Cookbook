extends Node2D
class_name Match3Game

# Functions

func _on_return_button_up():
	get_tree().change_scene_to_packed(load("res://Start.tscn"))
