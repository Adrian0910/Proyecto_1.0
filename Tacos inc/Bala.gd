extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direccion = Vector2() setget _set_direccion
var velocidad = Vector2()
export var vel_lateral = 50
export var vel_max = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	set_fixed_process(true)
	velocidad.x = 0
	velocidad.y = 0

func _fixed_process(delta):
	velocidad.x = direccion * vel_lateral
	var movimiento = velocidad + delta
	move(movimiento)
	
func _set_direccion(value):
	direccion=Vector2(value,0)
	
	pass