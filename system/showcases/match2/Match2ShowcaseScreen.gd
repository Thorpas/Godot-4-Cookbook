extends ShowcaseScreen

# Constants
## Shared back for all cards.
const CARD_BACK = preload("res://data/images/icon.svg")

# Variables
## Set of eight different card faces.
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
## Set of cards used in initialization.
var _cards:Array = []

# Functions
## Controls if and how long the cards are shown at the start of the game.
var _revealTime:float = 2.5

## Interface
func _initialize_match_2_game(columns:int, revealTime:float):
	await transition_into_color(Color.BLACK, 0.5)
	$Match2Game.columns = columns
	_update_turn_counter(0)
	$Match2Game.initialize_match_2_game(_cards)
	$Interface/Start.set_disabled(false)
	_update_turn_counter($Match2Game.get_turns())
	_update_possible_matches($Match2Game.count_possible_matches())
	_revealTime = revealTime
	await transition_from_color(Color.BLACK, 0.5)
### Game Versions
func _on_fixed_16_button_up():
	_cards = [
		$Match2Game.create_match_2_card(&"Black", load("res://data/images/black_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Black", load("res://data/images/black_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Blue", load("res://data/images/blue_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Blue", load("res://data/images/blue_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Green", load("res://data/images/green_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Green", load("res://data/images/green_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Orange", load("res://data/images/orange_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Orange", load("res://data/images/orange_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Purple", load("res://data/images/purple_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Purple", load("res://data/images/purple_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Red", load("res://data/images/red_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Red", load("res://data/images/red_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"White", load("res://data/images/white_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"White", load("res://data/images/white_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Yellow", load("res://data/images/yellow_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Yellow", load("res://data/images/yellow_square.png"), CARD_BACK),
	]
	await _initialize_match_2_game(4, 2.5)
func _on_random_16_button_up():
	_cards = $Match2Game.create_card_pairs(_faces, CARD_BACK)
	await _initialize_match_2_game(4, 2.5)
func _on_random_16_blind_button_up():
	_cards = $Match2Game.create_card_pairs(_faces, CARD_BACK)
	await _initialize_match_2_game(4, 0.0)
func _on_fixed_32_duplicates_button_up():
	_cards = [
		$Match2Game.create_match_2_card(&"Black", load("res://data/images/black_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Blue", load("res://data/images/blue_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Green", load("res://data/images/green_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Orange", load("res://data/images/orange_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Purple", load("res://data/images/purple_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Red", load("res://data/images/red_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"White", load("res://data/images/white_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Yellow", load("res://data/images/yellow_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Black", load("res://data/images/black_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Blue", load("res://data/images/blue_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Green", load("res://data/images/green_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Orange", load("res://data/images/orange_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Purple", load("res://data/images/purple_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Red", load("res://data/images/red_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"White", load("res://data/images/white_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Yellow", load("res://data/images/yellow_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Black", load("res://data/images/black_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Blue", load("res://data/images/blue_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Green", load("res://data/images/green_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Orange", load("res://data/images/orange_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Purple", load("res://data/images/purple_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Red", load("res://data/images/red_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"White", load("res://data/images/white_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Yellow", load("res://data/images/yellow_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Black", load("res://data/images/black_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Blue", load("res://data/images/blue_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Green", load("res://data/images/green_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Orange", load("res://data/images/orange_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Purple", load("res://data/images/purple_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Red", load("res://data/images/red_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"White", load("res://data/images/white_square.png"), CARD_BACK),
		$Match2Game.create_match_2_card(&"Yellow", load("res://data/images/yellow_square.png"), CARD_BACK),
	]
	await _initialize_match_2_game(8, 2.5)
func _on_random_32_duplicates_button_up():
	_cards = $Match2Game.create_equal_card_sets(_faces, CARD_BACK, 4)
	await _initialize_match_2_game(8, 2.5)
func _on_random_32_duplicates_blind_button_up():
	_cards = $Match2Game.create_equal_card_sets(_faces, CARD_BACK, 4)
	await _initialize_match_2_game(8, 0.0)
func _on_random_32_multiples_button_up():
	_cards = $Match2Game.create_random_card_sets(_faces, CARD_BACK, 16)
	await _initialize_match_2_game(8, 2.5)
func _on_random_32_multiples_blind_button_up():
	_cards = $Match2Game.create_random_card_sets(_faces, CARD_BACK, 16)
	await _initialize_match_2_game(8, 0.0)
### Game
func _on_start_button_up():
	$Match2Game.start_game(_revealTime)
	$Interface/Start.set_disabled(true)
	_update_turn_counter($Match2Game.get_turns())
	_update_possible_matches($Match2Game.count_possible_matches())
func _on_match_2_game_card_selected():
	_update_turn_counter($Match2Game.get_turns())
	_update_possible_matches($Match2Game.count_possible_matches())
func _on_match_2_game_game_over():
	pass
func _update_turn_counter(turns:int):
	$Turns.set_text("[center][font_size=27]Turns\n" + str(turns))
func _update_possible_matches(matches:int):
	$Matches.set_text("[center][font_size=27]Turns\n" + str(matches))
