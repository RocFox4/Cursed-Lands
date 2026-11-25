extends CharacterBody2D

# Declare variables
var dirX = 0
var dirY = 0
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var perseguir_jugador = false
var jugador = null
var viu = true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var pos_inicial = Vector2()


func _ready():
	viu = true
	pos_inicial = position
	get_node("CollisionShape2D").disabled = false
	get_node("punxes/CollisionShape2D1").disabled = false
	get_node("punxes/CollisionShape2D1").disabled = false
	
func _physics_process(_delta):
	if jugador != null:
		# Calculate the direction to the jugador
		dirX = jugador.position.x - position.x
		dirY = jugador.position.y - position.y
		var res = sqrt((dirX * dirX) + (dirY * dirY))
		if res != 0 and perseguir_jugador:
			# Normalize the direction and apply speed
			velocity.x = (dirX / res) * SPEED 
			velocity.y = (dirY / res) * SPEED 
	# Move the character
			move_and_slide()

func _on_area_detecció_body_entered(body):
	if body.name == "Momia":
		jugador = body
		perseguir_jugador = true

func _on_area_detecció_body_exited(body):
	if body.name == "Momia":
		jugador = null
		perseguir_jugador = false


func _on_punxes_body_entered(body):
	if viu:
		if body.name == "Momia":
			perseguir_jugador = false
			body.die()
			position = pos_inicial


func _on_cap_body_entered(body):
	if body.name == "Momia":
		get_node("CollisionShape2D").disabled = true
		viu = false
		perseguir_jugador = false
		velocity.y= gravity
		move_and_slide()
		$AnimatedSprite2D.play("mort")
		$AudioStreamPlayer2D.play()
func _on_animated_sprite_2d_animation_finished():
	queue_free()

