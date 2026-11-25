extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.monedes = 25
	Global.duracióDelJoc = 250
	$Momia/ContadorMonedes.set_text(str(Global.monedes))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Momia":
		body.die()
		if $Enemic1:
			$Enemic1.position = $Enemic1.pos_inicial
		if $Enemic2:
			$Enemic2.position = $Enemic2.pos_inicial
		if $Enemic3:
			$Enemic3.position = $Enemic3.pos_inicial
		if $Enemic4:
			$Enemic4.position = $Enemic4.pos_inicial
		if $Enemic5:
			$Enemic5.position = $Enemic5.pos_inicial
		if $Enemic6:
			$Enemic6.position = $Enemic6.pos_inicial
		if $Enemic7:
			$Enemic7.position = $Enemic7.pos_inicial
		if $Enemic8:
			$Enemic8.position = $Enemic8.pos_inicial
		if $Enemic9:
			$Enemic9.position = $Enemic9.pos_inicial
		if $Enemic10:
			$Enemic10.position = $Enemic10.pos_inicial
		if $Enemic11:
			$Enemic11.position = $Enemic11.pos_inicial
		if $Enemic12:
			$Enemic12.position = $Enemic12.pos_inicial
