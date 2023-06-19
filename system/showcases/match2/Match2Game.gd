extends Node2D
class_name Match2Game

signal flips_increased

@export var columns:int
var _flips:int = 0
var _cardSelected:Match2Card = null

func initialize_match_2_game(cards:Array):
	_flips = 0
	emit_signal("flips_increased")
	$Cards.set_columns(columns)
	_cardSelected = null
	for _card in $Cards.get_children():
		$Cards.remove_child(_card)
	for _card in cards:
		$Cards.add_child(_card)
		_card.card_selected.connect(on_card_selected)
func create_randomized_cards(faces:Dictionary, back:Texture2D)->Array:
	var _cards:Array = []
	var _randomized:Array = []
	for _key in faces:
		_cards.append(create_match_2_card(_key, faces[_key], back))
		_cards.append(create_match_2_card(_key, faces[_key], back))
	while _cards.size() > 0:
		var _card:Match2Card = _cards.pick_random()
		_randomized.append(_card)
		_cards.erase(_card)
	return _randomized
func start_game(timer:float):
	if timer > 0.0:
		await _reveal_cards()
		$Timer.start(timer)
		await $Timer.timeout
	await _hide_cards()
func create_match_2_card(key:StringName, face:Texture2D, back:Texture2D)->Match2Card:
	var _card:Match2Card = load("res://system/showcases/match2/card/Match2Card.tscn").instantiate()
	_card.initialize_match_2_card(key, face, back)
	return _card

## Cards
func on_card_selected(card):
	if _cardSelected == null:
		_flips += 1
		emit_signal("flips_increased")
		_cardSelected = card
		_cardSelected.show_face()
	else:
		if _cardSelected == card:
			_cardSelected.hide_face()
			_cardSelected = null
		elif _cardSelected.check_match(card):
			_flips += 1
			emit_signal("flips_increased")
			_cardSelected.on_card_matched()
			_cardSelected = null
			card.show_face()
			card.on_card_matched()
		else:
			_flips += 1
			emit_signal("flips_increased")
			card.show_face()
			await disable_cards()
			$Timer.start(1.5)
			await $Timer.timeout
			await enable_cards()
			card.hide_face()
			_cardSelected.hide_face()
			_cardSelected = null
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
