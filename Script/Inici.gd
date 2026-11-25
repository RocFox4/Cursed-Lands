class_name Inici extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
		

func _on_sortir_pressed():
	get_tree().quit()


func _on_inici_pressed():
	get_node("/root/Global").g_canvi_escena("lvl1")


func _on_opcions_pressed():
	get_node("/root/Global").g_canvi_escena("Inici")


func _on_inici_mouse_entered():
	$Inici.modulate.a = 0.7


func _on_inici_mouse_exited():
	$Inici.modulate.a = 1.0


func _on_sortir_mouse_entered():
	$Sortir.modulate.a = 0.7


func _on_sortir_mouse_exited():
	$Sortir.modulate.a = 1.0
