extends TextureButton
class_name Match3Piece

# Constants

## Signals
signal piece_selected(piece)
# Variables
var _color:StringName = &"Color"

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
		&"Gold":
			set_modulate(Color.YELLOW)
		&"Red":
			set_modulate(Color.RED)
### Color
func get_color()->StringName:
	return _color
func check_match(other:Match3Piece)->bool:
	return _color == other.get_color()

## Button
func _on_button_down():
	emit_signal(&"piece_selected", self)
