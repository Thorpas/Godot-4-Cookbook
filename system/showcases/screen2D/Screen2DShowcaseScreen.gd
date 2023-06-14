extends ShowcaseScreen

# Functions

## Godot
func _ready():
	await transition_from_color(Color.BLACK, 0.6)

## Interface
### Transitions
func _on_color_button_up():
	var _r:int = int($Interface/HBox/VBox/Red.value)
	var _g:int = int($Interface/HBox/VBox/Green.value)
	var _b:int = int($Interface/HBox/VBox/Blue.value)
	await transition_into_color(Color8(_r, _g, _b), 0.5)
	await transition_from_color(Color8(_r, _g, _b), 0.5)
func _on_texture_button_up():
	await transition_into_texture(load("res://data/images/icon.svg"), 0.5, Color.BLACK)
	await transition_from_texture(load("res://data/images/icon.svg"), 0.5, Color.WHITE)
