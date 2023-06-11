extends TextureButton
class_name Match3Piece

# Constants

## Signals
signal piece_selected(piece)
signal piece_matched(piece)

# Variables
#@export_category("Piece")
var _color:StringName = &"Color"
var _column:int
var _row:int

# Functions

## Godot
### Signals
func connect_piece_selected(receiver):
	piece_selected.connect(Callable(receiver, &"on_piece_selected"))

## Piece
func initialize_piece(color:StringName):
	_color = color
	match _color:
		&"Blue":
			set_modulate(Color.BLUE)
		&"Green":
			set_modulate(Color.YELLOW)
		&"Red":
			set_modulate(Color.RED)
func on_match():
	_color = &"Gray"
	set_modulate(Color.DIM_GRAY)
### Color
func get_color()->StringName:
	return _color
func check_match(other:Match3Piece)->bool:
	if _color == other.get_color():
		return true
	return false
### Selection
func set_selected(selected:bool):
	if selected:
		set_rotation_degrees(180)
	else:
		set_rotation_degrees(0)

## Button
func _on_button_down():
	emit_signal(&"piece_selected", self)
