extends Node2D
class_name AbstractScreen2D

# Functions

## Transition
### Color
func transition_from_color(color:Color, duration:float):
	await $Transition.hide_color_tween(color, duration)
func transition_into_color(color:Color, duration:float):
	await $Transition.show_color_tween(color, duration)
