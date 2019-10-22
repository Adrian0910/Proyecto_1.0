extends Node

#Se enlaza con la clase "Barra_enemigo" para generar los obstaculos
export (PackedScene) var Barra_enemigo 
var score #Variante que almacena el puntaje del jugador



# Al iniciar el juego randomiza la secuencia de aparicion de los obstaculos
func _ready():
	randomize()
	
#Funcion para comenzar un juego nuevo
func nuevo_juego():
	score=0
	$Nave.inicio($Posicion_inicio.position)#se agrega la posicion de inicio del jugador
	$Star_timer.start() #Se comienza el temporizador de 2 segundos para comenzar el juego
	$Interfaz.mostrar_mensaje("listo")  #Usa el metodo "mostrar_mensaje" para la cadena "listo"
	$Interfaz.update_score(score)   #Llama el metodo "update_score" para mostrar el puntaje

#Funcion que detiene los timers de score y de aparicion de obstaculos
#Llama la funcion "game_over" para mostrar los mensajes correspondientes
func game_over():
	$Score_timer.stop()
	$Enemigo_timer.stop()
	$Interfaz.game_over()
	

#Funcion que comienza el timer de score y de aparicion de obstaculos
#Comienza al finalizar el timer "start_timer"
func _on_Star_timer_timeout():
	$Enemigo_timer.start()
	$Score_timer.start()

#Cada 1 segundo incrementa en 1 la variable score
#Llama la funcion "update_score" y la alimenta con el valor de la variable "score"
func _on_Score_timer_timeout():
	score+=1
	$Interfaz.update_score(score)
	
	
#Cada 0.5 se genera una nueva instancia de la clase "Barra_enemigo"
#Cada 0.5 segundos se reinicia el timer de obstaculos
func _on_Enemigo_timer_timeout():
	
#Crea una nueva instancia de la clase "Barra_enemigo"
	
	#$Camino_enemigo/Posicion_enemigo.set_offset(randi())	
	var b=Barra_enemigo.instance()
	add_child(b)
	
	#var dirreccion =$Camino_enemigo/Posicion_enemigo.rotation
	
	#Su posicion inicial siempre es igual
	b.position = $Posicion_barra.position
	
	#Se define su velocidad de forma random #entre los valores 
	#de "min_speed" y "max_speed" correspondientes a la clase "Barra_enemigo"
	b.set_linear_velocity(Vector2(rand_range(b.min_speed,b.max_speed),0).rotated(PI/2))	
	







func _on_Nave_golpe():
	game_over()
