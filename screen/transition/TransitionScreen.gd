extends CanvasLayer
class_name Transition

# Variables

# Functions

## Transition
### Visibility
func show_transition(transition:StringName):
	$Black.set_mouse_filter($Black.MOUSE_FILTER_STOP)
	set_visible(true)
	$AnimationPlayer.play(transition)
	await $AnimationPlayer.animation_finished
func hide_transition(transition:StringName):
	$AnimationPlayer.play_backwards(transition)
	await $AnimationPlayer.animation_finished
	$Black.set_mouse_filter($Black.MOUSE_FILTER_IGNORE)
	set_visible(false)
