extends ShowcaseScreen

# Functions
func _on_chess_button_up():
	await transition_into_color(Color.BLACK, 0.5)
	$Chess.set_visible(true)
	$CheckerboardGame.initialize_chess_game()
	await transition_from_color(Color.BLACK, 0.5)
