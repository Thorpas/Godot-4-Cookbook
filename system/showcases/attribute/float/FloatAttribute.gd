extends AbstractAttribute
class_name FloatAttribute

# Variables

## Attribute
### Multiplicant
var _multiplicant:float = 0.0
var _addend:float = 0.0
### Constraints
@export_category("Base Constraints")
## Upper limit of the multiplicant used in calculations.
@export var multiplicantMaximum:float = 999999.0
## Lower limit of the multiplicant used in calculations.
@export var multiplicantMinimum:float = 0.0
@export_category("Addend Constraints")
## Upper limit of the addend used in calculations.
@export var addendMaximum:float = 999999.0
## Lower limit of the addend used in calculations.
@export var addendMinimum:float = 0.0

# Functions

## Godot
func _ready():
	assert(multiplicantMinimum <= multiplicantMaximum, "Impossible Base Constraints!")
	assert(addendMinimum <= addendMaximum, "Impossible Addend Constraints!")

## Attribute
func _initialize_integer_attribute(multiplicant:float, multiplier:float, addend:float):
	set_multiplicant(multiplicant)
	set_multiplier(multiplier)
	set_addend(addend)

## Value
func get_value()->float:
	var _value = _calculate_value(get_multiplicant(), get_multiplier(), get_addend())
	if _value < valueMinimum:
		_value = valueMinimum
	elif _value > valueMaximum:
		_value = valueMaximum
	return _value
### Base
func set_multiplicant(multiplicant:float):
	_multiplicant = multiplicant
func edit_multiplicant(value:float):
	_multiplicant += value
func get_multiplicant()->float:
	if _multiplicant < multiplicantMinimum:
		return multiplicantMinimum
	elif _multiplicant > multiplicantMaximum:
		return multiplicantMaximum
	return _multiplicant
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
