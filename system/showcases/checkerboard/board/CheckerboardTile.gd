extends TextureButton
class_name CheckerboardTile

# Variables
var _tileID:int
var _piece:CheckerboardPiece

# Functions

## Tile
func initialize_checkerboard_tile(ID:int, size:Vector2):
	_tileID = ID
	_set_tile_size(size)
func _set_tile_size(size):
	set_custom_minimum_size(size)
	set_size(size)

## Piece
func get_piece()->CheckerboardPiece:
	return _piece
func set_piece(piece:CheckerboardPiece):
	_piece = piece
	add_child(_piece)
	_piece.set_position(get_size()/2)
