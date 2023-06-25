extends Node
class_name AbstractAttribute

# Variables


## Attribute
### Multiplier
var _multiplier:float = 1.0
### Constraints
@export_category("Multiplier Constraints")
## Upper limit of the multiplier used in calculations.
@export var multiplierMaximum:float = 999999.0
## Lower limit of the multiplier used in calculations.
@export var multiplierMinimum:float = 0.0
@export_category("Value Constraints")
## Upper limit of the returned value.
@export var valueMaximum:float = 999999.0
## Lower limit of the returned value.
@export var valueMinimum:float = 0.0

# Functions

## Godot
func _ready():
	assert(multiplierMinimum <= multiplierMaximum, "Impossible Multiplier Constraints!")
	assert(valueMinimum <= valueMaximum, "Impossible Value Constraints!")

## Value
func _calculate_value(base, multiplier:float, addend):
	return (multiplier * base) + addend
### Multiplier
func set_multiplier(multiplier:float):
	_multiplier = multiplier
func edit_multiplier(value:float):
	_multiplier += value
func get_multiplier()->float:
	if _multiplier < multiplierMinimum:
		return multiplierMinimum
	elif _multiplier > multiplierMaximum:
		return multiplierMaximum
	return _multiplier
