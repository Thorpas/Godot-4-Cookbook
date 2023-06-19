extends ShowcaseScreen

# Functions
var _revealTime:float = 2.5

## Interface
func _on_fixed_16_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	var _cards:Array = [
		$Match2Game.create_match_2_card(&"Black", load("res://data/images/black_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Black", load("res://data/images/black_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Blue", load("res://data/images/blue_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Blue", load("res://data/images/blue_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Green", load("res://data/images/green_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Green", load("res://data/images/green_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Orange", load("res://data/images/orange_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Orange", load("res://data/images/orange_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Purple", load("res://data/images/purple_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Purple", load("res://data/images/purple_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Red", load("res://data/images/red_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Red", load("res://data/images/red_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"White", load("res://data/images/white_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"White", load("res://data/images/white_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Yellow", load("res://data/images/yellow_square.png"), load("res://data/images/icon.svg")),
		$Match2Game.create_match_2_card(&"Yellow", load("res://data/images/yellow_square.png"), load("res://data/images/icon.svg")),
	]
	$Match2Game.initialize_match_2_game(_cards)
	$Interface/Start.set_disabled(false)
	await transition_from_color(Color.BLACK, 0.5)
	_revealTime = 2.5
func _on_random_16_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	var _faces:Dictionary = {
		&"Black": load("res://data/images/black_square.png"),
		&"Blue": load("res://data/images/blue_square.png"),
		&"Green": load("res://data/images/green_square.png"),
		&"Orange": load("res://data/images/orange_square.png"),
		&"Purple": load("res://data/images/purple_square.png"),
		&"Red": load("res://data/images/red_square.png"),
		&"White": load("res://data/images/white_square.png"),
		&"Yellow": load("res://data/images/yellow_square.png"),
	}
	$Match2Game.initialize_match_2_game($Match2Game.create_randomized_cards(_faces, load("res://data/images/icon.svg")))
	$Interface/Start.set_disabled(false)
	await transition_from_color(Color.BLACK, 0.5)
	_revealTime = 2.5
func _on_random_blind_16_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	var _faces:Dictionary = {
		&"Black": load("res://data/images/black_square.png"),
		&"Blue": load("res://data/images/blue_square.png"),
		&"Green": load("res://data/images/green_square.png"),
		&"Orange": load("res://data/images/orange_square.png"),
		&"Purple": load("res://data/images/purple_square.png"),
		&"Red": load("res://data/images/red_square.png"),
		&"White": load("res://data/images/white_square.png"),
		&"Yellow": load("res://data/images/yellow_square.png"),
	}
	$Match2Game.initialize_match_2_game($Match2Game.create_randomized_cards(_faces, load("res://data/images/icon.svg")))
	$Interface/Start.set_disabled(false)
	await transition_from_color(Color.BLACK, 0.5)
	_revealTime = 0.0
func _on_start_button_up():
	$Match2Game.start_game(_revealTime)
	$Interface/Start.set_disabled(true)
func _on_match_2_game_flips_increased():
	$Turns.set_text("[center][font_size=27]Turns: " + str($Match2Game._flips))
