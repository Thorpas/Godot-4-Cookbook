extends Node2D
class_name AbstractScreen2D

# Functions

## Transition
### Color
func transition_into_color(color:Color, duration:float):
	await $Transition.show_color_tween(color, duration)
func transition_from_color(color:Color, duration:float):
	await $Transition.hide_color_tween(color, duration)
### Texture
func transition_into_texture(texture:Texture2D, duration:float, color:Color=Color(0,0,0,0)):
	await $Transition.show_texture_tween(texture, duration, color)
func transition_from_texture(texture:Texture2D, duration:float, color:Color=Color(0,0,0,0)):
	await $Transition.hide_texture_tween(texture, duration, color)
