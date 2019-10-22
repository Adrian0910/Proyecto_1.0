extends RigidBody2D
export var min_speed =150
export var max_speed=250
var tipos_barra=["Negra","Blanca"]

func _ready():
	 $Sprite.animation = tipos_barra[randi() % tipos_barra.size()]
	 colisiones($Sprite.animation)
	
func colisiones(dibujo):
	if dibujo == "Negra":
		$colision_izq.disabled=true
		$Colision_der.disabled=false
		
	if dibujo =="Blanca":
		$Colision_der.disabled=true
		$colision_izq.disabled=false
	

	

func _on_Visibility_screen_excited():
	queue_free()

