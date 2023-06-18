extends AbstractScreen2D

# Functions

## Godot
func _ready():
	await transition_from_color(Color.BLACK, 0.6)

## Interface
func _on_checkerboard_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().change_scene_to_packed(load("res://system/showcases/checkerboard/CheckerboardShowcaseScreen.tscn"))
func _on_match_3_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().change_scene_to_packed(load("res://system/showcases/match3/Match3ShowcaseScreen.tscn"))
func _on_screen_2D_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().change_scene_to_packed(load("res://system/showcases/screen2D/Screen2DShowcaseScreen.tscn"))
### GitHub
func _on_git_hub_button_up():
	OS.shell_open("https://github.com/Thorpas/TPS-Cookbook")
### Godot
func _on_godot_button_up():
	OS.shell_open("https://godotengine.org")
func _on_license_button_up():
	OS.shell_open("https://godotengine.org/license/")
#	$Interface/Popup/License.set_text(Engine.get_license_text())
#	$Interface/Popup.popup_centered()https://godotengine.org/license/
### Quit
func _on_quit_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	get_tree().quit()
