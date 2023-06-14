extends CanvasLayer
class_name TransitionLayer

# Variables
@export_group("Color")
## If true shows $Color on ready.
@export var showColor:bool
## Color to show on ready.
@export var readyColor:Color
@export_group("Texture")
## If true shows $Texture on ready.
@export var showTexture:bool
## Texture to show on ready.
@export var readyTexture:Texture2D

# Functions

## Godot
func _ready():
	if showColor:
		_set_color(readyColor)
		_show_color()
	else:
		_hide_color()
	if showTexture:
		_set_texture(readyTexture)
		_show_texture()
	else:
		_hide_texture()

## Transition
func _show_transition():
	set_visible(true)
func _hide_transition():
	set_visible(false)
### Color
func hide_color_tween(color:Color, duration:float):
	var _tween:Tween = get_tree().create_tween()
	_set_color(color)
	$Color.set_modulate(Color(1,1,1,1))
	_show_color()
	_tween.tween_property($Color, "modulate", Color(1,1,1,0), duration)
	await _tween.finished
	_hide_transition()
	_hide_color()
func show_color_tween(color:Color, duration:float):
	var _tween:Tween = get_tree().create_tween()
	_set_color(color)
	$Color.set_modulate(Color(1,1,1,0))
	_show_color()
	_show_transition()
	_tween.tween_property($Color, "modulate", Color(1,1,1,1), duration)
	await _tween.finished
func _set_color(color:Color):
	$Color.color = color
func _show_color():
	$Color.set_mouse_filter($Color.MOUSE_FILTER_STOP)
	$Color.set_visible(true)
func _hide_color():
	$Color.set_mouse_filter($Color.MOUSE_FILTER_IGNORE)
	$Color.set_visible(false)
### Texture
func hide_texture_tween(texture:Texture2D, duration:float, color:Color=Color(0,0,0,0)):
	var _tween:Tween = get_tree().create_tween()
	_set_color(color)
	$Color.set_modulate(Color(1,1,1,1))
	_show_color()
	_set_texture(texture)
	$Texture.set_modulate(Color(1,1,1,1))
	_show_texture()
	_tween.set_parallel(true)
	_tween.tween_property($Color, "modulate", Color(1,1,1,0), duration)
	_tween.tween_property($Texture, "modulate", Color(1,1,1,0), duration)
	await _tween.finished
	_tween.set_parallel(false)
	_hide_transition()
	_hide_color()
	_hide_texture()
func show_texture_tween(texture:Texture2D, duration:float, color:Color=Color(0,0,0,0)):
	var _tween:Tween = get_tree().create_tween()
	_set_color(color)
	$Color.set_modulate(Color(1,1,1,0))
	_show_color()
	_set_texture(texture)
	$Texture.set_modulate(Color(1,1,1,0))
	_show_texture()
	_show_transition()
	_tween.set_parallel(true)
	_tween.tween_property($Color, "modulate", Color(1,1,1,1), duration)
	_tween.tween_property($Texture, "modulate", Color(1,1,1,1), duration)
	await _tween.finished
	_tween.set_parallel(false)
func _set_texture(texture:Texture2D):
	$Texture.set_texture(texture)
func _show_texture():
	$Texture.set_mouse_filter($Texture.MOUSE_FILTER_STOP)
	$Texture.set_visible(true)
func _hide_texture():
	$Texture.set_mouse_filter($Texture.MOUSE_FILTER_IGNORE)
	$Texture.set_visible(false)
