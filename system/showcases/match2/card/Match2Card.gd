extends TextureButton
class_name Match2Card

signal card_selected(card)

# Variables
## Key to determine matching cards.
var _key:StringName = &"key"
## Wether the card has been matched or not.
var _matched:bool = false

# Functions

## Card
func initialize_match_2_card(key:StringName, face:Texture2D, back:Texture2D):
	_key = key
	set_texture_normal(face)
	$Back.set_texture(back)
	set_disabled(true)
	hide_face()
func check_match(other)->bool:
	return _key == other.get_key()
func check_unmatched()->bool:
	return not _matched
func show_face():
	_hide_back()
func hide_face():
	_show_back()
func on_card_matched():
	_matched = true
	set_disabled(true)
	set_modulate(Color.DARK_GRAY)
func _on_card_selected():
	emit_signal("card_selected", self)
func disable_card():
	set_disabled(true)
func enable_card():
	if not _matched:
		set_disabled(false)
### Key
func get_key()->StringName:
	return _key
### Back
func _hide_back():
	$Back.set_visible(false)
func _show_back():
	$Back.set_visible(true)
