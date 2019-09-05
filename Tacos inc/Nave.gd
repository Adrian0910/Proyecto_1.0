extends Area2D
export (int) var velocidad
var Movimiento = Vector2()
var limiteVentana
# Called when the node enters the scene tree for the first time.
func _ready():
	limiteVentana = get_viewport_rect().size
	pass # Replace with function body.

func _process(delta):
	Movimiento = Vector2()# reinicis vslor del vector
	if Input.is_action_pressed("ui_right"):#Mueve la nave a la derecha
		Movimiento.x +=1
	if Input.is_action_pressed("ui_left"):#Mueve la nave a la izq
		Movimiento.x -=1
	if Input.is_action_pressed("ui_up"):#Mueve la nave hacia arriba
		Movimiento.y -=1
	if Input.is_action_pressed("ui_down"):#Mueve la nave hacia abajo
		Movimiento.y +=1
	
	if Movimiento.length()>0:
		Movimiento = Movimiento.normalized() * velocidad
	
	position += Movimiento* delta #Mueve el objeto nave
	position.x = clamp(position.x,25, limiteVentana.x-25)
	position.y = clamp(position.y,25, limiteVentana.y-50)
	
	
func inicio(pos):
		position = pos
		show() #mostrar el jugador
		#$Collisionshape.disabled=false
	
	#if Movimiento.x !=0:
	#	$AnimatedSprite.animation = "Nave"
	#elif Movimiento.y !=0:
	#	$AnimatedSprite.animation = "Nave"
	#else:
	#	$AnimatedSprite.animation = "Alto"
