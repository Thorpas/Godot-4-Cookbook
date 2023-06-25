extends ShowcaseScreen

# Variables
@onready var _float = $FloatAttribute
@onready var _integer = $IntegerAttribute

# Functions

## Godot
func _ready():
	_update_float_labels()
	_update_integer_labels()

## Interface
### Float
func _update_float_labels():
	$Interface/VBoxContainer/FloatHBox/BaseVBox/FloatBaseLabel.set_text("[center][font_size=27]Base: " + str(_float.get_base()))
	$Interface/VBoxContainer/FloatHBox/MultiplierVBox/FloatMultiplierLabel.set_text("[center][font_size=27]Multiplier: " + str(_float.get_multiplier()))
	$Interface/VBoxContainer/FloatHBox/AddendVBox/FloatAddendLabel.set_text("[center][font_size=27]Addend: " + str(_float.get_addend()))
	$Interface/VBoxContainer/FloatHBox/ValueVBox/FloatValue.set_text("[center][font_size=27]Value: " + str(_float.get_value()))
func _on_float_base_plus_button_up():
	_float.edit_base(+0.1)
	_update_float_labels()
func _on_float_base_minus_button_up():
	_float.edit_base(-0.1)
	_update_float_labels()
func _on_float_multiplier_plus_button_up():
	_float.edit_multiplier(+0.1)
	_update_float_labels()
func _on_float_multiplier_minus_button_up():
	_float.edit_multiplier(-0.1)
	_update_float_labels()
func _on_float_addend_plus_button_up():
	_float.edit_addend(+0.1)
	_update_float_labels()
func _on_float_addend_minus_button_up():
	_float.edit_addend(-0.1)
	_update_float_labels()
### Integer
func _update_integer_labels():
	$Interface/VBoxContainer/IntegerHBox/BaseVBox/IntegerBaseLabel.set_text("[center][font_size=27]Base: " + str(_integer.get_base()))
	$Interface/VBoxContainer/IntegerHBox/MultiplierVBox/IntegerMultiplierLabel.set_text("[center][font_size=27]Multiplier: " + str(_integer.get_multiplier()))
	$Interface/VBoxContainer/IntegerHBox/AddendVBox/IntegerAddendLabel.set_text("[center][font_size=27]Addend: " + str(_integer.get_addend()))
	$Interface/VBoxContainer/IntegerHBox/ValueVBox/IntegerValue.set_text("[center][font_size=27]Value: " + str(_integer.get_value()))
func _on_integer_base_plus_button_up():
	_integer.edit_base(+1)
	_update_integer_labels()
func _on_integer_base_minus_button_up():
	_integer.edit_base(-1)
	_update_integer_labels()
func _on_integer_multiplier_plus_button_up():
	_integer.edit_multiplier(+0.1)
	_update_integer_labels()
func _on_integer_multiplier_minus_button_up():
	_integer.edit_multiplier(-0.1)
	_update_integer_labels()
func _on_integer_addend_plus_button_up():
	_integer.edit_addend(+1)
	_update_integer_labels()
func _on_integer_addend_minus_button_up():
	_integer.edit_addend(-1)
	_update_integer_labels()
