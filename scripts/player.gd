extends CharacterBody2D

var current_dir = 'none'

func _ready():
	$AnimatedSprite2D.play("idle")

func setMovement(mov, anim):
	if mov == 1:
		anim.play("running")
	elif mov == 0:
		anim.play("idle")
	
func play_anim(velocity): 
	var dir = current_dir
	var anim = $AnimatedSprite2D
	if velocity.x > 0:
		anim.flip_h = false
		anim.play("running")
	elif velocity.x < 0:
		anim.flip_h = true
		anim.play("running")
	elif velocity.y != 0:
		anim.play("running")
	else:
		anim.play("idle")

@export var speed = 200

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	play_anim(velocity)
		

func _physics_process(delta):
	get_input()
	move_and_slide()