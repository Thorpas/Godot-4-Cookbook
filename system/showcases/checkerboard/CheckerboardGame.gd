extends Node2D
class_name ChackerboardGame

# Functions

## Godot
func _ready():
	_initialize_color_board(Vector2(75, 75), Color.RED, Color.BLUE)

## Board
func _initialize_color_board(tileSize:Vector2, tileA:Color, tileB:Color):
	$Checkerboard.initialize_checkerboard(tileSize, tileA, tileB)
func _initialize_texture_board(tileSize:Vector2, tileA:Texture2D, tileB:Texture2D):
	$Checkerboard.initialize_checkerboard(tileSize, tileA, tileB)
### Games
func initialize_chess_game():
	_initialize_color_board(Vector2(75, 75), Color.CORNSILK, Color.DARK_GREEN)
