extends Node2D
class_name Checkerboard

# Functions

## Board
func initialize_checkerboard(tileSize:Vector2, tileA, tileB):
	var _i:int = 0
	for _tile in $Grid.get_children():
		$Grid.remove_child(_tile)
	while _i < 64:
		var _tile = TextureButton.new()
		_tile.set_name("Tile" + str(_i))
		_tile.button_up.connect(on_tile_selected.bind(_i))
		_tile.set_ignore_texture_size(true)
		_tile.set_stretch_mode(TextureButton.STRETCH_SCALE)
		_tile.set_custom_minimum_size(tileSize)
		if (_i%2 + (int(_i/8)%2)) == 1:
			if typeof(tileA) == TYPE_COLOR:
				_tile.set_texture_normal(PlaceholderTexture2D.new())
				_tile.set_modulate(tileA)
			elif tileA.is_class("Texture2D"):
				_tile.set_texture_normal(tileA)
		else: 
			if typeof(tileB) == TYPE_COLOR:
				_tile.set_texture_normal(PlaceholderTexture2D.new())
				_tile.set_modulate(tileB)
			elif tileB.is_class("Texture2D"):
				_tile.set_texture_normal(tileB)
		$Grid.add_child(_tile)
		_i += 1
func _check_coordinates_are_valid(x:int, y:int)->bool:
	return x >= 0 and x < 8 and y >= 0 and y < 8
func _coordinates_to_id(x:int, y:int)->int:
	return (x * 8) + y
func _id_to_coordinates(id:int)->Vector2i:
	return Vector2i(int(id/8), id%8)

## Tiles
func on_tile_selected(id:int):
	print($Grid.get_child(id).get_name())
