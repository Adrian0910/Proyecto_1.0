extends RigidBody2D
export var min_speed =150
export var max_speed=250
var tipos_barra=["Negra","Blanca"]

func _ready():
	 $Sprite.animation = tipos_barra[randi() % tipos_barra.size()]
	

	

func _on_Visibility_screen_excited():
	queue_free()

