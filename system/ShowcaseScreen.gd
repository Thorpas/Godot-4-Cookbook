extends AbstractScreen2D
class_name ShowcaseScreen

# Functions

## Godot
func _ready():
	await transition_from_color(Color.BLACK, 0.5)

## Interface
### Return
func _on_return_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().change_scene_to_packed(load("res://system/StartScreen.tscn"))
