extends Node2D
class_name CheckerboardGame

# Constants
enum GAMES{CHESS}

const BLACK = &"Black"
const WHITE = &"White"

const BISHOP = &"Bishop"
const KING = &"King"
const KNIGHT = &"Knight"
const PAWN = &"Pawn"
const QUEEN = &"Queen"
const ROOK = &"ROOK"

# Functions
var _game:GAMES

## Godot
func _ready():
	_initialize_color_board(Vector2(75, 75), Color.RED, Color.BLUE)

## Chess
func initialize_chess_game():
	var _piece:ChessPiece
	_game = GAMES.CHESS
	await _initialize_color_board(Vector2(75, 75), Color.BURLYWOOD, Color.SADDLE_BROWN)
	_piece = _create_chess_piece(ROOK, BLACK)
	_set_piece_on_board(_piece, 0, 0)
	_piece = _create_chess_piece(KNIGHT, BLACK)
	_set_piece_on_board(_piece, 1, 0)
	_piece = _create_chess_piece(BISHOP, BLACK)
	_set_piece_on_board(_piece, 2, 0)
	_piece = _create_chess_piece(QUEEN, BLACK)
	_set_piece_on_board(_piece, 3, 0)
	_piece = _create_chess_piece(KING, BLACK)
	_set_piece_on_board(_piece, 4, 0)
	_piece = _create_chess_piece(BISHOP, BLACK)
	_set_piece_on_board(_piece, 5, 0)
	_piece = _create_chess_piece(KNIGHT, BLACK)
	_set_piece_on_board(_piece, 6, 0)
	_piece = _create_chess_piece(ROOK, BLACK)
	_set_piece_on_board(_piece, 7, 0)
	_piece = _create_chess_piece(PAWN, BLACK)
	_set_piece_on_board(_piece, 0, 1)
	_piece = _create_chess_piece(PAWN, BLACK)
	_set_piece_on_board(_piece, 1, 1)
	_piece = _create_chess_piece(PAWN, BLACK)
	_set_piece_on_board(_piece, 2, 1)
	_piece = _create_chess_piece(PAWN, BLACK)
	_set_piece_on_board(_piece, 3, 1)
	_piece = _create_chess_piece(PAWN, BLACK)
	_set_piece_on_board(_piece, 4, 1)
	_piece = _create_chess_piece(PAWN, BLACK)
	_set_piece_on_board(_piece, 5, 1)
	_piece = _create_chess_piece(PAWN, BLACK)
	_set_piece_on_board(_piece, 6, 1)
	_piece = _create_chess_piece(PAWN, BLACK)
	_set_piece_on_board(_piece, 7, 1)
	_piece = _create_chess_piece(PAWN, WHITE)
	_set_piece_on_board(_piece, 0, 6)
	_piece = _create_chess_piece(PAWN, WHITE)
	_set_piece_on_board(_piece, 1, 6)
	_piece = _create_chess_piece(PAWN, WHITE)
	_set_piece_on_board(_piece, 2, 6)
	_piece = _create_chess_piece(PAWN, WHITE)
	_set_piece_on_board(_piece, 3, 6)
	_piece = _create_chess_piece(PAWN, WHITE)
	_set_piece_on_board(_piece, 4, 6)
	_piece = _create_chess_piece(PAWN, WHITE)
	_set_piece_on_board(_piece, 5, 6)
	_piece = _create_chess_piece(PAWN, WHITE)
	_set_piece_on_board(_piece, 6, 6)
	_piece = _create_chess_piece(PAWN, WHITE)
	_set_piece_on_board(_piece, 7, 6)
	_piece = _create_chess_piece(ROOK, WHITE)
	_set_piece_on_board(_piece, 0, 7)
	_piece = _create_chess_piece(KNIGHT, WHITE)
	_set_piece_on_board(_piece, 1, 7)
	_piece = _create_chess_piece(BISHOP, WHITE)
	_set_piece_on_board(_piece, 2, 7)
	_piece = _create_chess_piece(QUEEN, WHITE)
	_set_piece_on_board(_piece, 3, 7)
	_piece = _create_chess_piece(KING, WHITE)
	_set_piece_on_board(_piece, 4, 7)
	_piece = _create_chess_piece(BISHOP, WHITE)
	_set_piece_on_board(_piece, 5, 7)
	_piece = _create_chess_piece(KNIGHT, WHITE)
	_set_piece_on_board(_piece, 6, 7)
	_piece = _create_chess_piece(ROOK, WHITE)
	_set_piece_on_board(_piece, 7, 7)
### Pieces
func _create_chess_piece(piece:StringName, color:StringName)->ChessPiece:
	var _piece:ChessPiece
	match piece:
		BISHOP:
			_piece = load("res://system/showcases/checkerboard/chess/piece/bishop/BishopChessPiece.tscn").instantiate()
		KING:
			_piece = load("res://system/showcases/checkerboard/chess/piece/king/KingChessPiece.tscn").instantiate()
		KNIGHT:
			_piece = load("res://system/showcases/checkerboard/chess/piece/knight/KnightChessPiece.tscn").instantiate()
		PAWN:
			_piece = load("res://system/showcases/checkerboard/chess/piece/pawn/PawnChessPiece.tscn").instantiate()
		QUEEN:
			_piece = load("res://system/showcases/checkerboard/chess/piece/queen/QueenChessPiece.tscn").instantiate()
		ROOK:
			_piece = load("res://system/showcases/checkerboard/chess/piece/ROOK/ROOKChessPiece.tscn").instantiate()
	_piece.initialize_chess_piece(color)
	return _piece

## Board
func _initialize_color_board(tileSize:Vector2, tileA:Color, tileB:Color):
	$Checkerboard.initialize_checkerboard(tileSize, tileA, tileB)
func _initialize_texture_board(tileSize:Vector2, tileA:Texture2D, tileB:Texture2D):
	$Checkerboard.initialize_checkerboard(tileSize, tileA, tileB)
### Tiles
### Pieces
func _set_piece_on_board(piece:CheckerboardPiece, x:int, y:int):
	$Checkerboard.set_piece_on_board(piece, x, y)
