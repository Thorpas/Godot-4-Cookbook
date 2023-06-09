extends Node2D
class_name Match3Grid

# Signals

# Variables

## Match 3
var _pieceSelected:Match3Piece = null
## Grid
var _columns:int = 0
var _rows:int = 0
var _pieces:Array = []

## Pieces
var _pieceWidth:float = 128
var _pieceHeight:float = 128

# Functions

## Match
func _check_matches(pieces:Array)->bool:
	for _piece in pieces:
		var _column:int = _local_to_grid(_piece.get_position()).x
		var _row:int = _local_to_grid(_piece.get_position()).y
		print("checking match at (" + str(_column) + "/" + str(_row) + ")")
		if _check_coordinates_valid(_column, _row-1) and _piece.check_match(get_piece(_column, _row-1)):
			if _check_coordinates_valid(_column, _row-2) and _piece.check_match(get_piece(_column, _row-2)):
				if _check_coordinates_valid(_column, _row+1) and _piece.check_match(get_piece(_column, _row+1)):
					if _check_coordinates_valid(_column, _row+2) and _piece.check_match(get_piece(_column, _row+2)):
						print(_piece.get_color() + " Match 5 V-2+2 at (" + str(_column) + "/" + str(_row) + ")")
					else:
						print(_piece.get_color() + " Match 4 V-2+1 at (" + str(_column) + "/" + str(_row) + ")")
				else:
					print(_piece.get_color() + " Match 3 V-2 at (" + str(_column) + "/" + str(_row) + ")")
			elif _check_coordinates_valid(_column, _row+1) and _piece.check_match(get_piece(_column, _row+1)):
				if _check_coordinates_valid(_column, _row+2) and _piece.check_match(get_piece(_column, _row+2)):
					print(_piece.get_color() + " Match 4 V-1+2 at (" + str(_column) + "/" + str(_row) + ")")
				else:
					print(_piece.get_color() + " Match 3 V-1+1 at (" + str(_column) + "/" + str(_row) + ")")
		if _check_coordinates_valid(_column-1, _row) and _piece.check_match(get_piece(_column-1, _row)):
			if _check_coordinates_valid(_column-2, _row) and _piece.check_match(get_piece(_column-2, _row)):
				if _check_coordinates_valid(_column+1, _row) and _piece.check_match(get_piece(_column+1, _row)):
					if _check_coordinates_valid(_column+2, _row) and _piece.check_match(get_piece(_column+2, _row)):
						print(_piece.get_color() + " Match 5 H-2+2 at (" + str(_column) + "/" + str(_row) + ")")
					else:
						print(_piece.get_color() + " Match 4 H-2+1 at (" + str(_column) + "/" + str(_row) + ")")
				else:
					print(_piece.get_color() + " Match 3 H-2 at (" + str(_column) + "/" + str(_row) + ")")
			elif _check_coordinates_valid(_column+1, _row) and _piece.check_match(get_piece(_column+1, _row)):
				if _check_coordinates_valid(_column+2, _row) and _piece.check_match(get_piece(_column+2, _row)):
					print(_piece.get_color() + " Match 4 H-1+2 at (" + str(_column) + "/" + str(_row) + ")")
				else:
					print(_piece.get_color() + " Match 3 H-1+1 at (" + str(_column) + "/" + str(_row) + ")")
func _check_match_on_creation(column:int, row:int, piece:Match3Piece)->bool:
	if row > 1 and get_piece(column, row-1).check_match(piece) and get_piece(column, row-2).check_match(piece):
		return true
	if column > 1 and get_piece(column-1, row).check_match(piece) and get_piece(column-2, row).check_match(piece):
		return true
	return false
## Grid
func initialize_grid(columns:int, rows:int, pieces:Array):
	_columns = columns
	_rows = rows
	_pieces = []
	for _c in _columns:
		_pieces.append([])
		for _r in _rows:
			var _p = _create_piece(pieces.pick_random())
			while _check_match_on_creation(_c, _r, _p):
				_p = _create_piece(pieces.pick_random())
			_pieces[_c].append(_p)
			_p.connect_piece_selected(self)
			$Pieces.add_child(_p)
			_p.set_position(_grid_to_local(_c, _r))
func _check_coordinates_valid(column:int, row:int)->bool:
	return column >= 0 and column < _columns and row >= 0 and row < _rows
## Pieces
func check_piece_selected()->bool:
	return _pieceSelected != null
func check_move_valid(A:Match3Piece, B:Match3Piece):
	return true
func get_piece(column:int, row:int):
	return _pieces[column][row]
func select_piece(piece:Match3Piece):
	_pieceSelected = piece
func on_piece_selected(piece:Match3Piece):
	if check_piece_selected() and check_move_valid(_pieceSelected, piece):
		_swap_pieces(_pieceSelected, piece)
		_check_matches([_pieceSelected, piece])
		select_piece(null)
	else:
		select_piece(piece)
func _create_piece(color:StringName)->Match3Piece:
	var _piece = load("res://match3/piece/Match3Piece.tscn").instantiate()
	_piece.initialize_piece(color)
	return _piece
func _swap_pieces(A:Match3Piece, B:Match3Piece):
	var _aPosition = _local_to_grid(A.get_position())
	var _bPosition = _local_to_grid(B.get_position())
	_pieces[_aPosition.x][_aPosition.y] = A
	_pieces[_bPosition.x][_bPosition.y] = B
	A.set_position(_grid_to_local(_bPosition.x, _bPosition.y))
	B.set_position(_grid_to_local(_aPosition.x, _aPosition.y))
### Position
func _grid_to_local(column:int, row:int)->Vector2:
	return Vector2(column * _pieceWidth, row * _pieceHeight)
func _local_to_grid(local:Vector2)->Vector2:
	return Vector2(local.x / _pieceWidth, local.y / _pieceHeight)
