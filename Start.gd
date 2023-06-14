extends Node2D
class_name StartScreen

# Functions

## Interface
func _on_chess_button_up():
	get_tree().change_scene_to_packed(load("res://chess/ChessShowcase.tscn"))
func _on_match_3_button_up():
	get_tree().change_scene_to_packed(load("res://match3/Match3Showcase.tscn"))
func _on_screen_2D_button_up():
	get_tree().change_scene_to_packed(load("res://screen/ShowcaseScreen2D.tscn"))
### Quit
func _on_quit_button_up():
	get_tree().quit()
