extends Node2D
class_name AbstractScreen2D

# Functions

## Transition
func transition_from_black():
	await $Transition.hide_transition(&"Black")
func transition_into_black():
	await $Transition.show_transition(&"Black")
