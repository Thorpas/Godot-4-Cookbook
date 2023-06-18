extends CheckerboardPiece
class_name ChessPiece

# Variables
var _color:StringName = &"Color"
var _moved:bool = false

# Functions
func initialize_chess_piece(color:StringName):
	_color = color
	match _color:
		CheckerboardGame.BLACK:
			set_modulate(Color.BLACK)
		CheckerboardGame.WHITE:
			set_modulate(Color.WHITE)
func get_possible_movements()->Array:
	return []
func get_possible_captures()->Array:
	return []
func on_movement():
	_moved = true
func check_color(color:StringName):
	return _color == color
