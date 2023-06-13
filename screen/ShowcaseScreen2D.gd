extends AbstractScreen2D

# Functions

## Godot
func _ready():
	await transition_from_color(Color.BLACK, 0.5)

## Interface
func _on_transition_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	await transition_from_color(Color.BLACK, 0.5)
