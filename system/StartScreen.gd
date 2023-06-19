extends AbstractScreen2D

# Functions

## Godot
func _ready():
	await transition_from_color(Color.BLACK, 0.6)

## Interface
### GitHub
func _on_git_hub_button_up():
	OS.shell_open("https://github.com/Thorpas/Godot-4-Cookbook")
### Godot
func _on_godot_button_up():
	OS.shell_open("https://godotengine.org")
func _on_license_button_up():
	OS.shell_open("https://godotengine.org/license/")
### Quit
func _on_quit_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().quit()
### Game Showcases
func _on_checkerboard_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().change_scene_to_packed(load("res://system/showcases/checkerboard/CheckerboardShowcaseScreen.tscn"))
func _on_match_2_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().change_scene_to_packed(load("res://system/showcases/match2/Match2ShowcaseScreen.tscn"))
func _on_match_3_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().change_scene_to_packed(load("res://system/showcases/match3/Match3ShowcaseScreen.tscn"))
### System Showcases
func _on_screen_2D_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().change_scene_to_packed(load("res://system/showcases/screen2D/Screen2DShowcaseScreen.tscn"))
