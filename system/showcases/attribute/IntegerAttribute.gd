extends AbstractAttribute
class_name IntegerAttribute

# Variables

## Attribute
### Base
var _base:int = 0
var _addend:int = 0
### Constraints
@export_category("Base Constraints")
@export var baseMaximum:int = 999999
@export var baseMinimum:int = 0
@export_category("Addend Constraints")
@export var addendMaximum:int = 999999
@export var addendMinimum:int = 0

# Functions

## Godot
func _ready():
	assert(baseMinimum <= baseMaximum, "Impossible Base Constraints!")
	assert(addendMinimum <= addendMaximum, "Impossible Addend Constraints!")

## Attribute
func _initialize_integer_attribute(base:int, multiplier:float, addend:int):
	set_base(base)
	set_multiplier(multiplier)
	set_addend(addend)

## Value
func get_value()->int:
	var _value = int(_calculate_value(get_base(), get_multiplier(), get_addend()))
	if _value < valueMinimum:
		_value = valueMinimum
	elif _value > valueMaximum:
		_value = valueMaximum
	return _value
### Base
func set_base(base:int):
	_base = base
func edit_base(value:int):
	_base += value
func get_base()->int:
	if _base < baseMinimum:
		return baseMinimum
	elif _base > baseMaximum:
		return baseMaximum
	return _base
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
