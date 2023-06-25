extends AbstractAttribute
class_name IntegerAttribute

# Variables

## Attribute
### Multiplicant
var _multiplicant:int = 0
var _addend:int = 0
### Constraints
@export_category("Multiplicant Constraints")
## Upper limit of the multiplicant used in calculations.
@export var multiplicantMaximum:int = 999999
## Lower limit of the multiplicant used in calculations.
@export var multiplicantMinimum:int = 0
@export_category("Addend Constraints")
## Upper limit of the addend used in calculations.
@export var addendMaximum:int = 999999
## Lower limit of the addend used in calculations.
@export var addendMinimum:int = 0

# Functions

## Godot
func _ready():
	assert(multiplicantMinimum <= multiplicantMaximum, "Impossible Base Constraints!")
	assert(addendMinimum <= addendMaximum, "Impossible Addend Constraints!")

## Attribute
func _initialize_integer_attribute(multiplicant:int, multiplier:float, addend:int):
	set_multiplicant(multiplicant)
	set_multiplier(multiplier)
	set_addend(addend)

## Value
func get_value()->int:
	var _value = int(_calculate_value(get_multiplicant(), get_multiplier(), get_addend()))
	if _value < valueMinimum:
		_value = valueMinimum
	elif _value > valueMaximum:
		_value = valueMaximum
	return _value
### Multiplicant
func set_multiplicant(multiplicant:int):
	_multiplicant = multiplicant
func edit_multiplicant(value:int):
	_multiplicant += value
func get_multiplicant()->int:
	if _multiplicant < multiplicantMinimum:
		return multiplicantMinimum
	elif _multiplicant > multiplicantMaximum:
		return multiplicantMaximum
	return _multiplicant
### Addend
func set_addend(addend:int):
	_addend = addend
func edit_addend(value:int):
	_addend += value
func get_addend()->int:
	if _addend < addendMinimum:
		return addendMinimum
	elif _addend > addendMaximum:
		return addendMaximum
	return _addend
