extends Node
class_name IntegerAttribute

# Variables
@export var valueMinimum:int = -99999
@export var valueMaximum:int = 99999
var _multiplicant:int = 0
@export var multiplicantMinimum:int = -99999
@export var multiplicantMaximum:int = 99999
var _multiplier:float = 1.0
@export var multiplierMinimum:float = 0.05
@export var multiplierMaximum:float = 10.0
var _multipliers:Array = []
var _addend:int = 0
@export var addendMinimum:int = -99999
@export var addendMaximum:int = 99999

# Functions

## Attribute
func initiliaze_integer_attribute(multiplicant:int, multiplier:float, addend:int):
	_multiplicant = multiplicant
	_multiplier = multiplier
	_addend = addend
func get_value()->int:
	return mini(maxi(_calculate_value(), valueMinimum), valueMaximum)
func _calculate_value()->int:
	return int((get_multiplier() * get_multiplicant()) + get_addend())

## Multiplicant
func get_multiplicant()->int:
	return mini(maxi(_multiplicant, multiplicantMinimum), multiplicantMaximum)
func edit_multiplicant(value:int):
	_multiplicant += value

## Multiplier
func get_multiplier()->float:
	return minf(maxf(_multiplier, multiplierMinimum), multiplierMaximum)
func append_multiplier(value:float):
	_multipliers.append(value)
	_calculate_multiplier()
func remove_multiplier(value:float):
	_multipliers.erase(value)
	_calculate_multiplier()
func _calculate_multiplier():
	_multiplier = 1.0
	for _value in _multipliers:
		_multiplier *= _value

## Addend
func get_addend()->int:
	return mini(maxi(_addend, addendMinimum), addendMaximum)
func edit_addend(value:int):
	_addend += value
