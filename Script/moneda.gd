extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$coinflip.play("gir")


func _on_body_entered(body):
	if body.name == "Momia":
		$bot.play("bot")
		$AudioStreamPlayer2D.play()
		body.sumar_moneda()

func _on_bot_animation_finished(anim_name):
	queue_free()
