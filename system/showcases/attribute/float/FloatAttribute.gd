extends AbstractAttribute
class_name FloatAttribute

# Variables

## Attribute
### Base
var _base:float = 0.0
var _addend:float = 0.0
### Constraints
@export_category("Base Constraints")
## Upper limit of the multiplicant used in calculations.
@export var baseMaximum:float = 999999.0
## Lower limit of the multiplicant used in calculations.
@export var baseMinimum:float = 0.0
@export_category("Addend Constraints")
## Upper limit of the addend used in calculations.
@export var addendMaximum:float = 999999.0
## Lower limit of the addend used in calculations.
@export var addendMinimum:float = 0.0

# Functions

## Godot
func _ready():
	assert(baseMinimum <= baseMaximum, "Impossible Base Constraints!")
	assert(addendMinimum <= addendMaximum, "Impossible Addend Constraints!")

## Attribute
func _initialize_integer_attribute(base:float, multiplier:float, addend:float):
	set_base(base)
	set_multiplier(multiplier)
	set_addend(addend)

## Value
func get_value()->float:
	var _value = _calculate_value(get_base(), get_multiplier(), get_addend())
	if _value < valueMinimum:
		_value = valueMinimum
	elif _value > valueMaximum:
		_value = valueMaximum
	return _value
### Base
func set_base(base:float):
	_base = base
func edit_base(value:float):
	_base += value
func get_base()->float:
	if _base < baseMinimum:
		return baseMinimum
	elif _base > baseMaximum:
		return baseMaximum
	return _base
### Addend
func set_addend(addend:float):
	_addend = addend
func edit_addend(value:float):
	_addend += value
func get_addend()->float:
	if _addend < addendMinimum:
		return addendMinimum
	elif _addend > addendMaximum:
		return addendMaximum
	return _addend
