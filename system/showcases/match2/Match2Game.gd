extends Node2D
class_name Match2Game

signal card_selected
signal game_over

@export var columns:int
var _turns:int = 0
var _cardSelected:Match2Card = null

# Functions

## Game
func initialize_match_2_game(cards:Array):
	_turns = 0
	$Cards.set_columns(columns)
	_cardSelected = null
	for _card in $Cards.get_children():
		$Cards.remove_child(_card)
	for _card in cards:
		$Cards.add_child(_card)
		_card.card_selected.connect(on_card_selected)
func start_game(timer:float):
	if timer > 0.0:
		await _reveal_cards()
		$Timer.start(timer)
		await $Timer.timeout
	await _hide_cards()
func check_game_over():
	if count_possible_matches() == 0:
		emit_signal("game_over")
### Turns
func get_turns()->int:
	return _turns

## Cards
func create_match_2_card(key:StringName, face:Texture2D, back:Texture2D)->Match2Card:
	var _card:Match2Card = load("res://system/showcases/match2/card/Match2Card.tscn").instantiate()
	_card.initialize_match_2_card(key, face, back)
	return _card
func create_randomized_cards(faces:Dictionary, back:Texture2D, cards:int):
	var _cards:Array = []
	for _i in cards:
		var _key = faces.keys().pick_random()
		_cards.append(create_match_2_card(_key, faces[_key], back))
	return _cards
func create_equal_card_sets(faces:Dictionary, back:Texture2D, multiples:int):
	var _cards:Array = []
	var _randomized:Array = []
	for _key in faces:
		for _i in multiples:
			_cards.append(create_match_2_card(_key, faces[_key], back))
	while _cards.size() > 0:
		var _card:Match2Card = _cards.pick_random()
		_randomized.append(_card)
		_cards.erase(_card)
	return _randomized
func create_card_pairs(faces:Dictionary, back:Texture2D)->Array:
	return create_equal_card_sets(faces, back, 2)
func count_possible_matches()->int:
	var _keys:Dictionary = {}
	var _matches:int = 0
	for _card in $Cards.get_children():
		if _card.check_unmatched():
			if _card.get_key() in _keys:
				_keys[_card.get_key()] += 1
			else: 
				_keys[_card.get_key()] = 1
	for _key in _keys:
		if _keys[_key] > 1:
			_matches += int(_keys[_key] / 2)
	return _matches
func on_card_selected(card):
	if _cardSelected == null:
		_turns += 1
		_cardSelected = card
		_cardSelected.show_face()
	else:
		if _cardSelected == card:
			_cardSelected.hide_face()
			_cardSelected = null
		elif _cardSelected.check_match(card):
			_turns += 1
			_cardSelected.on_card_matched()
			_cardSelected = null
			card.show_face()
			card.on_card_matched()
		else:
			_turns += 1
			card.show_face()
			await disable_cards()
			$Timer.start(1.5)
			await $Timer.timeout
			await enable_cards()
			card.hide_face()
			_cardSelected.hide_face()
			_cardSelected = null
	emit_signal("card_selected")
	check_game_over()
func disable_cards():
	for _card in $Cards.get_children():
		_card.disable_card()
func enable_cards():
	for _card in $Cards.get_children():
		_card.enable_card()
func _reveal_cards():
	for _card in $Cards.get_children():
		_card.show_face()
		_card.set_disabled(true)
func _hide_cards():
	for _card in $Cards.get_children():
		_card.hide_face()
		_card.set_disabled(false)
