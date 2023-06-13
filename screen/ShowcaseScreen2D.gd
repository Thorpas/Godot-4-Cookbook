extends AbstractScreen2D

# Functions

## Godot
func _ready():
	await transition_from_color(Color.BLACK, 0.5)

## Interface

### Transitions
#### Texture
func _on_texture_transition_button_up():
	await transition_into_texture(load("res://icon.svg"), 0.5, Color.BLACK)
	await transition_from_texture(load("res://icon.svg"), 0.5, Color.WHITE)
#### Color
func _on_black_transition_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	await transition_from_color(Color.BLACK, 0.5)
func _on_blue_transition_button_up():
	await transition_into_color(Color.BLUE, 0.5)
	await transition_from_color(Color.BLUE, 0.5)
func _on_red_transition_button_up():
	await transition_into_color(Color.RED, 0.5)
	await transition_from_color(Color.RED, 0.5)
func _on_white_transition_button_up():
	await transition_into_color(Color.WHITE, 0.5)
	await transition_from_color(Color.WHITE, 0.5)
func _on_yellow_transition_button_up():
	await transition_into_color(Color.YELLOW, 0.5)
	await transition_from_color(Color.YELLOW, 0.5)
func _on_dynamic_color_transition_button_up():
	var _r:int = int($Interface/Transitions/VBoxContainer/DynamicRed.value)
	var _g:int = int($Interface/Transitions/VBoxContainer/DynamicGreen.value)
	var _b:int = int($Interface/Transitions/VBoxContainer/DynamicBlue.value)
	await transition_into_color(Color8(_r, _g, _b), 0.5)
	await transition_from_color(Color8(_r, _g, _b), 0.5)
