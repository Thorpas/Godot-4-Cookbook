extends CanvasLayer
class_name TransitionLayer

# Variables
@export var showColor:bool = true
@export var startColor:Color = Color.BLACK

# Functions

## Godot
func _ready():
	if showColor:
		_set_color(startColor)
		_show_color()
	else:
		_hide_color()
## Transition
func _show_transition():
	if showColor:
		_show_color()
	set_visible(true)
func _hide_transition():
	set_visible(false)
	_hide_color()
### Color
func hide_color_tween(color:Color, duration:float):
	var _tween:Tween = get_tree().create_tween()
	_set_color(color)
	_tween.tween_property($Color, "color", Color(0,0,0,0), duration)
	await _tween.finished
	_hide_transition()
func show_color_tween(color:Color, duration:float):
	var _tween:Tween = get_tree().create_tween()
	_set_color(Color(0,0,0,0))
	_show_transition()
	_tween.tween_property($Color, "color", color, duration)
	await _tween.finished
func _set_color(color:Color):
	$Color.color = color
func _show_color():
	$Color.set_mouse_filter($Color.MOUSE_FILTER_STOP)
	$Color.set_visible(true)
func _hide_color():
	$Color.set_mouse_filter($Color.MOUSE_FILTER_IGNORE)
	$Color.set_visible(false)
