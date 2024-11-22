extends CharacterBody2D

const speed = 300.0

@onready var Weapons = $Weapons
@onready var AnimationEpee = $AnimationPlayer
@onready var AttackTimer = $Weapons/AttackTimer

var PlayerCanAttack = true

#On définie les éléments de base ici.
func _ready():
	AttackTimer.wait_time = 2


#On gère ici la physique du personnage (déplacement et regard)
func _physics_process(delta):
	var direction := Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	if direction.length() > 1.0:
		direction = direction.normalized()
		
	set_velocity(speed * direction)
	move_and_slide()
	
	OrientatePlayer()
	
	if Input.is_action_pressed("attack") and PlayerCanAttack:
		PlayerCanAttack = false
		AttackTimer.start()
		Weapons.show()
		AnimationEpee.play("WeaponAttackAnimation")


#Permet d'orienter le jouer vers le coté ou on appuie
func OrientatePlayer():
	if not AnimationEpee.is_playing():
		if Input.is_action_pressed("attackTop"):
			rotation_degrees = 180
		if Input.is_action_pressed("attackDown"):
			rotation_degrees = 0
		if Input.is_action_pressed("attackLeft"):
			rotation_degrees = 90
		if Input.is_action_pressed("attackRight"):
			rotation_degrees = 270


#Quand l'animation est terminée, il faut cacher l'arme.
func _on_animation_player_animation_finished(anim_name):
	Weapons.hide()


#Quand le timer de l'attaque se termine, il faut reset la var pour que le player puisse re-attaquer
func _on_attack_timer_timeout():
	PlayerCanAttack = true
