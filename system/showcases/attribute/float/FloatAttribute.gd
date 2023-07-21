extends Node
class_name FloatAttribute

# Variables
@export var valueMinimum:float = 0.1
@export var valueMaximum:float = 100.0
var _multiplicant:float = 1.0
@export var multiplicantMinimum:float = 0.01
@export var multiplicantMaximum:float = 10.0
var _multiplier:float = 1.0
@export var multiplierMinimum:float = 0.01
@export var multiplierMaximum:float = 10.0
var _multipliers:Array = []
var _addend:float = 0.0
@export var addendMinimum:float = 0.0
@export var addendMaximum:float = 10.0

# Functions

## Attribute
func initiliaze_float_attribute(multiplicant:float, multiplier:float, addend:float):
	_multiplicant = multiplicant
	_multiplier = multiplier
	_addend = addend
func get_value()->float:
	return minf(maxf(_calculate_value(), valueMinimum), valueMaximum)
func _calculate_value()->float:
	return (get_multiplier() * get_multiplicant()) + get_addend()

## Multiplicant
func get_multiplicant()->float:
	return minf(maxf(_multiplicant, multiplicantMinimum), multiplicantMaximum)
func edit_multiplicant(value:float):
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
func get_addend()->float:
	return minf(maxf(_addend, addendMinimum), addendMaximum)
func edit_addend(value:float):
	_addend += value
