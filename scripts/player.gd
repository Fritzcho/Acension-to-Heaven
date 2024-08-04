extends CharacterBody2D

#const SPEED = 200.0
var current_dir = 'none'
#const right = {
#	action = "ui_right",
#	direction =  "right",
#	x = SPEED,
#	y = 0,
#}
#const left = {
#	action = "ui_left",
#	direction = "left",
#	negative = true,
#	x = -SPEED,
#	y = 0,
#}
#const up = {
#	action = "ui_up",
#	direction = "up",
#	negative = true,
#	x = 0,
#	y = -SPEED,
#}
#const down = {
#	action = "ui_down",
#	direction = "down",
#	negative = false,
#	x = 0,
#	y = SPEED,
#}
#var uiActionList = [right, left, up, down]

func _ready():
	$AnimatedSprite2D.play("idle")

# func _physics_process(delta):
#	player_movement(delta)

# func player_movement(delta):
# 
# 	for actionObject in uiActionList:
# 		for otherObject in uiActionList:
# 			if (actionObject != otherObject) and (Input.is_action_pressed(actionObject.action) and Input.is_action_pressed(otherObject.action)):
# 				current_dir = actionObject.direction
# 				play_anim(1)
# 				velocity.x = (actionObject.x+otherObject.x)/1.41
# 				velocity.y = (actionObject.y+otherObject.y)/1.41
# 			elif Input.is_action_pressed(actionObject.action):
# 				current_dir = actionObject.direction
# 				play_anim(1)
# 				velocity.x = actionObject.x
# 				velocity.y = actionObject.y
# 	if(Input.is_anything_pressed()==false):
# 		play_anim(0)
# 		velocity.x = 0
# 		velocity.y = 0
# 
# 	move_and_slide()
#
#

func setMovement(mov, anim):
	if mov == 1:
		anim.play("running")
	elif mov == 0:
		anim.play("idle")
	
func play_anim(velocity): 
	var dir = current_dir
	var anim = $AnimatedSprite2D
	#match dir:
	#	"right":
	#		anim.flip_h = false
	#		setMovement(movement, anim)
	#	"left": 
	#		anim.flip_h = true
	#		setMovement(movement, anim)
	#	"up":
	#		setMovement(movement, anim)
	#	"down":
	#		setMovement(movement, anim)

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
	
	print(velocity.x)

	play_anim(velocity)

		

func _physics_process(delta):
	get_input()
	move_and_slide()
