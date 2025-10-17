extends CharacterBody2D
 
@export var speed := 1100.0
@export var jump_velocity := -1700.0
@export var gravity := 1400.0
 
var is_attacking := false
 
@onready var anim = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $Jump_sound
 
func _physics_process(delta):
	# Gravité
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Si le joueur est au sol et pas en train d’attaquer
		if not is_attacking:
			if Input.get_axis("move_left", "move_right") == 0:
				anim.play("idle")
			else:
				anim.play("walk")
 
	# Déplacement horizontal
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * speed
		anim.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed * delta)
 
	# Saut
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		jump_sound.play()
		anim.play("jump")
 
	move_and_slide()
 
func _on_walk_sound_finished() -> void:
	pass # Replace with function body.
 
func _on_jump_sound_finished() -> void:
	pass # Replace with function body.
