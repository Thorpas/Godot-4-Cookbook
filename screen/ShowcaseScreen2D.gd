extends AbstractScreen2D


# Called when the node enters the scene tree for the first time.
func _ready():
	_loop(50)
func _loop(i:int):
	print("Loop Start")
	while i:
		print("Loop: " + str(i))
		await transition_into_black()
		await transition_from_black()
		i -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
