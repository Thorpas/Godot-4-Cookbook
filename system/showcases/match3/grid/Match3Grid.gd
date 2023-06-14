extends Node2D
class_name Match3Grid

# Signals
signal piece_selected(color, solumn, row)
signal score_gained(blue, green, red)

# Constants
const MATCH_H_0P2 = [Vector2i(0,0), Vector2i(+1,0), Vector2i(+2,0)]
const MATCH_H_1P1 = [Vector2i(-1,0), Vector2i(0,0), Vector2i(+1,0)]
const MATCH_H_2P0 = [Vector2i(-2,0), Vector2i(-1,0), Vector2i(0,0)]
const MATCH_V_0P2 = [Vector2i(0,0), Vector2i(0,+1), Vector2i(0,+2)]
const MATCH_V_1P1 = [Vector2i(0,-1), Vector2i(0,0), Vector2i(0,+1)]
const MATCH_V_2P0 = [Vector2i(0,-2), Vector2i(0,-1), Vector2i(0,0)]
const MATCH_H_1P2 = [Vector2i(-1,0), Vector2i(0,0), Vector2i(+1,0), Vector2i(+2,0)]
const MATCH_H_2P1 = [Vector2i(-2,0), Vector2i(-1,0), Vector2i(0,0), Vector2i(+1,0)]
const MATCH_V_1P2 = [Vector2i(0,-1), Vector2i(0,0), Vector2i(0,+1), Vector2i(0,+2)]
const MATCH_V_2P1 = [Vector2i(0,-2), Vector2i(0,-1), Vector2i(0,0), Vector2i(0,+1)]
const MATCH_H_2P2 = [Vector2i(-2,0), Vector2i(-1,0), Vector2i(0,0), Vector2i(+1,0), Vector2i(+2,0)]
const MATCH_V_2P2 = [Vector2i(0,-2), Vector2i(0,-1), Vector2i(0,0), Vector2i(0,+1), Vector2i(0,+2)]

# Variables

## Match 3
var _pieceSelected:Match3Piece = null
var _matchQueue:Array = []

## Grid
var _columns:int = 0
var _rows:int = 0
var _pieces:Array = []

## Pieces
var _pieceColors = []
var _pieceWidth:float = 128
var _pieceHeight:float = 128

# Functions

## Match
func _check_matches(pieces:Array):
	for _piece in pieces:
		var _coordinates:Vector2i = _local_to_grid(_piece.get_position())
		var _column:int = _coordinates.x
		var _row:int = _coordinates.y
		# Horizontal
		if _check_coordinates_valid(_column-1, _row) and _piece.check_match(get_piece(_column-1, _row)):# -?P--
			if _check_coordinates_valid(_column-2, _row) and _piece.check_match(get_piece(_column-2, _row)):# ?OP--
				if _check_coordinates_valid(_column+1, _row) and _piece.check_match(get_piece(_column+1, _row)):# OOP?-
					if _check_coordinates_valid(_column+2, _row) and _piece.check_match(get_piece(_column+2, _row)):# OOPO?
						_add_match_to_queue(_coordinates, MATCH_H_2P2)
					else:# OOPOX
						_add_match_to_queue(_coordinates, MATCH_H_2P1)
				else:# OOPX-
					_add_match_to_queue(_coordinates, MATCH_H_2P0)
			elif _check_coordinates_valid(_column+1, _row) and _piece.check_match(get_piece(_column+1, _row)):# XOP?-
				if _check_coordinates_valid(_column+2, _row) and _piece.check_match(get_piece(_column+2, _row)):# XOPO?
					_add_match_to_queue(_coordinates, MATCH_H_1P2)
				else:# XOPOX
					_add_match_to_queue(_coordinates, MATCH_H_1P1)
		elif _check_coordinates_valid(_column+1, _row) and _piece.check_match(get_piece(_column+1, _row)):# -XP?-
			if _check_coordinates_valid(_column+2, _row) and _piece.check_match(get_piece(_column+2, _row)):# -XPO?
				_add_match_to_queue(_coordinates, MATCH_H_0P2)
		# Vertical
		if _check_coordinates_valid(_column, _row-1) and _piece.check_match(get_piece(_column, _row-1)):# -?P--
			if _check_coordinates_valid(_column, _row-2) and _piece.check_match(get_piece(_column, _row-2)):# ?OP--
				if _check_coordinates_valid(_column, _row+1) and _piece.check_match(get_piece(_column, _row+1)):# OOP?-
					if _check_coordinates_valid(_column, _row+2) and _piece.check_match(get_piece(_column, _row+2)):# OOPO?
						_add_match_to_queue(_coordinates, MATCH_V_2P2)
					else:# OOPOX
						_add_match_to_queue(_coordinates, MATCH_V_2P1)
				else:# OOPX-
					_add_match_to_queue(_coordinates, MATCH_V_2P0)
			elif _check_coordinates_valid(_column, _row+1) and _piece.check_match(get_piece(_column, _row+1)):# XOP?-
				if _check_coordinates_valid(_column, _row+2) and _piece.check_match(get_piece(_column, _row+2)):# XOPO?
					_add_match_to_queue(_coordinates, MATCH_V_1P2)
				else:# XOPOX
					_add_match_to_queue(_coordinates, MATCH_V_1P1)
		elif _check_coordinates_valid(_column, _row+1) and _piece.check_match(get_piece(_column, _row+1)):# -XP?-
			if _check_coordinates_valid(_column, _row+2) and _piece.check_match(get_piece(_column, _row+2)):# -XPO?
				_add_match_to_queue(_coordinates, MATCH_V_0P2)
func _check_match_on_creation(column:int, row:int, piece:Match3Piece)->bool:
	if row > 1 and get_piece(column, row-1).check_match(piece) and get_piece(column, row-2).check_match(piece):
		return true
	if column > 1 and get_piece(column-1, row).check_match(piece) and get_piece(column-2, row).check_match(piece):
		return true
	return false
func check_move_valid(A:Match3Piece, B:Match3Piece):
	if A.check_match(B):
		return false
	if not (_local_to_grid(A.get_position()) - _local_to_grid(B.get_position())) in [Vector2i(0,-1), Vector2i(0,1), Vector2i(-1,0), Vector2i(1,0)]:
		return false
	return true
### Queue
func _add_match_to_queue(origin:Vector2i, coordinates:Array):
	var _match:Array = []
	for _coordinates in coordinates:
		_match.append(origin + _coordinates)
	_matchQueue.append(_match)
func _resolve_matches():
	var _piecesMatched:Array = []
	var _blue:int = 0
	var _green:int = 0
	var _red:int = 0
	for _match in _matchQueue:
		var _color = get_piece(_match[0].x, _match[0].y).get_color()
		for _coordinates in _match:
			var _piece = get_piece(_coordinates.x, _coordinates.y)
			if not _piece in _piecesMatched:
				_piecesMatched.append(_piece)
		match _color:
			&"Blue":
				_blue += _match.size()
			&"Green":
				_green += _match.size()
			&"Red":
				_red += _match.size()
	_matchQueue = []
	for _piece in _piecesMatched:
		_piece.on_match()
	emit_signal(&"score_gained", _blue, _green, _red)

## Grid
func initialize_grid(columns:int, rows:int, colors:Array):
	_columns = columns
	_rows = rows
	_pieces = []
	_pieceColors = colors
	for _c in _columns:
		_pieces.append([])
		for _r in _rows:
			var _p = _create_piece(_pieceColors.pick_random())
			while _check_match_on_creation(_c, _r, _p):
				_p = _create_piece(_pieceColors.pick_random())
			_pieces[_c].append(_p)
			_p.connect_piece_selected(self)
			$Pieces.add_child(_p)
			_p.set_position(_grid_to_local(_c, _r))
func _check_coordinates_valid(column:int, row:int)->bool:
	return column >= 0 and column < _columns and row >= 0 and row < _rows

## Pieces
func check_piece_selected()->bool:
	return _pieceSelected != null
func get_piece(column:int, row:int):
	return _pieces[column][row]
func _select_piece(piece:Match3Piece):
	if _pieceSelected != null:
		_pieceSelected.set_selected(false)
	_pieceSelected = piece
	if _pieceSelected != null:
		_pieceSelected.set_selected(true)
		emit_signal("piece_selected", piece.get_color(), _local_to_grid(piece.get_position()).x, _local_to_grid(piece.get_position()).y)
	else:
		emit_signal("piece_selected", &"None", -1, -1)
func on_piece_selected(piece:Match3Piece):
	if _pieceSelected == piece:
		_select_piece(null)
	elif check_piece_selected() and check_move_valid(_pieceSelected, piece):
		await _swap_pieces(_pieceSelected, piece)
		_check_matches([_pieceSelected, piece])
		if _matchQueue.size() > 0:
			_resolve_matches()
		else:
			_swap_pieces(piece, _pieceSelected)
		_select_piece(null)
	else:
		_select_piece(piece)
func _create_piece(color:StringName)->Match3Piece:
	var _piece = load("res://system/showcases/match3/piece/Match3Piece.tscn").instantiate()
	_piece.initialize_piece(color)
	return _piece
func _swap_pieces(A:Match3Piece, B:Match3Piece):
	var _aCoordinates = _local_to_grid(A.get_position())
	var _bCoordinates = _local_to_grid(B.get_position())
#	var _tween = get_tree().create_tween()
#	_tween.set_parallel(true)
#	_tween.tween_property(A, "position", _grid_to_local(_bCoordinates.x, _bCoordinates.y), 1)
#	_tween.tween_property(B, "position", _grid_to_local(_aCoordinates.x, _aCoordinates.y), 1)
#	await _tween
	_pieces[_aCoordinates.x][_aCoordinates.y] = B
	_pieces[_bCoordinates.x][_bCoordinates.y] = A
	A.set_position(_grid_to_local(_bCoordinates.x, _bCoordinates.y))
	B.set_position(_grid_to_local(_aCoordinates.x, _aCoordinates.y))
### Position
func _grid_to_local(column:int, row:int)->Vector2:
	return Vector2(column * _pieceWidth, row * _pieceHeight)
func _local_to_grid(local:Vector2)->Vector2i:
	return Vector2i(int(local.x / _pieceWidth), int(local.y / _pieceHeight))
