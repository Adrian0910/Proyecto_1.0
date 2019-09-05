extends CanvasLayer

#señal que se envia al main para comenzar el juego
signal iniciar_juego

#Funcion para mostrar la cadena introducida como "texto_a" en pantalla
func mostrar_mensaje(texto_a):
	$Mensajes.text=texto_a
	$Mensajes.show()
	$Mensaje_timer.start() #Se comienza un contador de tiempo antes de ocultar el mensaje
	
	
#Al perder el jugador se cambia el mensaje mostrado a " Juego Terminado"
#Despues de 2 segundos se cambia el mensaje a la bienvenida 
#y se muestra de nuevo el boton de inicio
func game_over():
	mostrar_mensaje("Juego Terminado")
	yield($Mensaje_timer, "timeout")
	$Button.show()
	$Mensajes.text="InterDimensiones"
	$Mensajes.show()
	
#Funcion para mostrar como cadena el numero que recibe como "puntos"
func update_score(puntos):
	$Score_label.text=str (puntos)
	$Score_label.show()

#Oculta el texto de la etiqueta "Mensajes" despues de 2 segundos
func _on_Mensaje_timer_timeout():
	$Mensajes.hide()
	

#Al ser presionado el boton "Button" se oculta el mismo
#y se emite la señal "iniciar_juego"
func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciar_juego")
	
	
	
func mostrar_rotacion(rotacion):
	$Label.text=str (rotacion)
	$Label.show()
	#$Mensaje_timer.start() #Se comienza un contador de tiempo antes de ocultar el mensaje
