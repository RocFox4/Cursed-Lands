extends Node

#script d'Autoload
const ESC_INICI: = preload("res://Escenes/Inici.tscn")
const ESC_ESCENARI_1: = preload("res://Escenes/Escenari.tscn")
const ESC_ESCENARI_2: = preload("res://Escenes/Escenari2.tscn")
const ESC_ESCENARI_3: = preload("res://Escenes/Escenari3.tscn")
var nivellActual= 1
var monedes = 0
var duracióDelJoc = 100
# Called every frame. 'delta' is the elapsed time since the previous frame.
func g_canvi_escena(escActual:String):
	if escActual == "lvl1":
		get_tree().change_scene_to_packed(ESC_ESCENARI_1)
	elif escActual == "lvl2":
		monedes = 10
		get_tree().change_scene_to_packed(ESC_ESCENARI_2)
	elif escActual == "lvl3":
		get_tree().change_scene_to_packed(ESC_ESCENARI_3)
	elif escActual== "menú":
		get_tree().change_scene_to_packed(ESC_INICI)

