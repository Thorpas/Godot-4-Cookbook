extends AbstractScreen2D

# Functions

## Godot
func _ready():
	await transition_from_black()

## Interface
func _on_transition_button_up():
	await transition_into_black()
	await transition_from_black()
