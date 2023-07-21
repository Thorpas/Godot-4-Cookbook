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
	$Interface/VBoxContainer/FloatHBox/MultiplicantVBox/FloatMultiplicantLabel.set_text("[center][font_size=27]Multiplicant: " + str(_float.get_multiplicant()))
	$Interface/VBoxContainer/FloatHBox/MultiplierVBox/FloatMultiplierLabel.set_text("[center][font_size=27]Multiplier: " + str(_float.get_multiplier()))
	$Interface/VBoxContainer/FloatHBox/AddendVBox/FloatAddendLabel.set_text("[center][font_size=27]Addend: " + str(_float.get_addend()))
	$Interface/VBoxContainer/FloatHBox/ValueVBox/FloatValue.set_text("[center][font_size=27]Value: " + str(_float.get_value()))
func _on_float_multiplicant_plus_button_up():
	_float.edit_multiplicant(+0.1)
	_update_float_labels()
func _on_float_multiplicant_minus_button_up():
	_float.edit_multiplicant(-0.1)
	_update_float_labels()
func _on_float_multiplier_up_plus_button_up():
	_float.append_multiplier(1.1)
	_update_float_labels()
func _on_float_multiplier_up_minus_button_up():
	_float.remove_multiplier(1.1)
	_update_float_labels()
func _on_float_multiplier_down_plus_button_up():
	_float.append_multiplier(0.9)
	_update_float_labels()
func _on_float_multiplier_down_minus_button_up():
	_float.remove_multiplier(0.9)
	_update_float_labels()
func _on_float_addend_plus_button_up():
	_float.edit_addend(+0.1)
	_update_float_labels()
func _on_float_addend_minus_button_up():
	_float.edit_addend(-0.1)
	_update_float_labels()
### Integer
func _update_integer_labels():
	$Interface/VBoxContainer/IntegerHBox/MultiplicantVBox/IntegerMultiplicantLabel.set_text("[center][font_size=27]Multiplicant: " + str(_integer.get_multiplicant()))
	$Interface/VBoxContainer/IntegerHBox/MultiplierVBox/IntegerMultiplierLabel.set_text("[center][font_size=27]Multiplier: " + str(_integer.get_multiplier()))
	$Interface/VBoxContainer/IntegerHBox/AddendVBox/IntegerAddendLabel.set_text("[center][font_size=27]Addend: " + str(_integer.get_addend()))
	$Interface/VBoxContainer/IntegerHBox/ValueVBox/IntegerValue.set_text("[center][font_size=27]Value: " + str(_integer.get_value()))
func _on_integer_multiplicant_plus_button_up():
	_integer.edit_multiplicant(+1)
	_update_integer_labels()
func _on_integer_multiplicant_minus_button_up():
	_integer.edit_multiplicant(-1)
	_update_integer_labels()
func _on_integer_multiplier_up_plus_button_up():
	_integer.append_multiplier(1.1)
	_update_integer_labels()
func _on_integer_multiplier_up_minus_button_up():
	_integer.remove_multiplier(1.1)
	_update_integer_labels()
func _on_integer_multiplier_down_plus_button_up():
	_integer.append_multiplier(0.9)
	_update_integer_labels()
func _on_integer_multiplier_down_minus_button_up():
	_integer.remove_multiplier(0.9)
	_update_integer_labels()
func _on_integer_addend_plus_button_up():
	_integer.edit_addend(+1)
	_update_integer_labels()
func _on_integer_addend_minus_button_up():
	_integer.edit_addend(-1)
	_update_integer_labels()
