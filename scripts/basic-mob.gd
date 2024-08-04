extends CharacterBody2D

var SPEED = 100
var player_chase = false
var player = null
var playerNode



func _ready():
	$AnimatedSprite2D.play("idle")


func _physics_process(delta):
	if player_chase:
		position += (player.position-position)/SPEED
		$AnimatedSprite2D.play("jumping")
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		if (player.position.x - position.x) > 0:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	

