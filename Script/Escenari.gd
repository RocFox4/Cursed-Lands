extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.monedes = 0
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
