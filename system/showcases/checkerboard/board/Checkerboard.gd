extends Node2D
class_name Checkerboard

# Functions
signal tile_selected(tile)

## Board
func initialize_checkerboard(tileSize:Vector2, tileA, tileB):
	var _i:int = 0
	for _tile in $Grid.get_children():
		$Grid.remove_child(_tile)
	while _i < 64:
		var _tile = load("res://system/showcases/checkerboard/board/CheckerboardTile.tscn").instantiate()
		_tile.initialize_checkerboard_tile(_i, tileSize)
		_tile.button_up.connect(on_tile_selected.bind(_i))
		if (_i%2 + (int(_i/8)%2)) != 1:
			if typeof(tileA) == TYPE_COLOR:
				_tile.set_self_modulate(tileA)
			elif tileA.is_class("Texture2D"):
				_tile.set_texture_normal(tileA)
		else: 
			if typeof(tileB) == TYPE_COLOR:
				_tile.set_self_modulate(tileB)
			elif tileB.is_class("Texture2D"):
				_tile.set_texture_normal(tileB)
		$Grid.add_child(_tile)
		_i += 1
func _check_coordinates_are_valid(x:int, y:int)->bool:
	return x >= 0 and x < 8 and y >= 0 and y < 8
func _grid_to_id(x:int, y:int)->int:
	return (y * 8) + x

## Tiles
func get_tile(tileID:int)->CheckerboardTile:
	return $Grid.get_child(tileID)
func on_tile_selected(id:int):
	emit_signal("tile_selected", id)

## Pieces
func set_piece_on_board(piece:CheckerboardPiece, x:int, y:int):
	_set_piece_on_tile(piece, _grid_to_id(x, y))
func _set_piece_on_tile(piece:CheckerboardPiece, tileID:int):
	get_tile(tileID).set_piece(piece)
