extends CharacterBody2D

@onready var contador: Timer = $contador

const SPEED = 310.0
const JUMP_VELOCITY = -500.0
var SpawnPoint = Vector2(60,-70)
var jugable= false
var viu = true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$Avisos.show()
	$ContadorMonedes.set_text(str(Global.monedes))
	if Global.nivellActual == 1:
		$Avisos2.set_text("NIVELL 1:
			Aconsegueix 10 monedes 
		(Abans que acabi el temps) 
		per passar al seguent nivell")
		await get_tree().create_timer(4.0).timeout
		$Avisos2.hide()
	elif Global.nivellActual == 2:
		$Avisos2.set_text("NIVELL 2:
			Aconsegueix 25 monedes 
		(Abans que acabi el temps) 
		per passar al seguent nivell")
		await get_tree().create_timer(4.0).timeout
		$Avisos2.hide()
	elif Global.nivellActual == 3:
		$Avisos2.set_text("NIVELL 3:
			Aconsegueix 50 monedes 
		(Abans que acabi el temps) 
		per passar al seguent nivell")
		await get_tree().create_timer(4.0).timeout
		$Avisos2.hide()
		
func _on_avisos_hidden():
	jugable = true
	contador.start(Global.duracióDelJoc)
	$ContadorTemps.set_text(str(Global.duracióDelJoc))
	
func _physics_process(delta):
	if viu:
		if jugable:
			$ContadorTemps.set_text(str(round(contador.time_left)))
			# Add the gravity.
			
			if not is_on_floor():
				$AnimacióQuiet.play("Caure")
				velocity.y += gravity * delta
				
			elif velocity.x <=0.01 and velocity.x >=-0.01:
				$AnimacióQuiet.play("default")
		
			else:
				$AnimacióQuiet.play("Correr")
			# Salt
			if (Input.is_action_just_released("ui_accept") or Input.is_action_just_released("ui_up")) and (velocity.y<0):
					velocity.y= JUMP_VELOCITY/4
			if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up") )and is_on_floor():
				velocity.y = JUMP_VELOCITY
			if Input.is_action_just_pressed("ui_left"):
				$AnimacióQuiet.flip_h = true
			if  Input.is_action_just_pressed("ui_right"):
				$AnimacióQuiet.flip_h = false
			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			var direction = Input.get_axis("ui_left", "ui_right")
			if direction:
				velocity.x = direction * SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
			move_and_slide()
	else:
		$AnimacióQuiet.play("Mort")
func die():
	viu = false
	$AudioStreamPlayer.play()
	await get_tree().create_timer(0.6).timeout
	viu = true
	velocity = Vector2(0,0)
	position = SpawnPoint
	
	
	
func sumar_moneda():
	Global.monedes = Global.monedes+1
	$ContadorMonedes.set_text(str(Global.monedes))
	if Global.monedes == 10:
		jugable= false
		$Avisos.show()
		$Avisos.set_text("ENORABONA! 0
		NIVELL 1 COMPLETAT")
		await get_tree().create_timer(4.0).timeout
		$Avisos.hide()
		Global.nivellActual = 2
		get_node("/root/Global").g_canvi_escena("lvl2")
	elif Global.monedes == 25:
		jugable= false
		$Avisos.show()
		$Avisos.set_text("ENORABONA! 
		NIVELL 2 COMPLETAT")
		await get_tree().create_timer(4.0).timeout
		$Avisos.hide()
		Global.nivellActual = 3
		get_node("/root/Global").g_canvi_escena("lvl3")
	elif Global.monedes == 50:
		jugable= false
		$Avisos.show()
		$Avisos.set_text("ENORABONA! 
		HAS COMPETAT EL JOC
		GRÀCIES PER JUGAR :)")
		await get_tree().create_timer(4.0).timeout
		$Avisos.hide()
		get_node("/root/Global").g_canvi_escena("menú")
func _on_timer_timeout():
	$Avisos.show()
	$Avisos.set_text("S'ha acabat el temps :(")
	die()
	jugable= false
	await get_tree().create_timer(4.0).timeout
	get_tree().reload_current_scene()





