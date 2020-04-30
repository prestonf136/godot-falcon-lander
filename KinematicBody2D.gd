extends KinematicBody2D

var velocity = Vector2()
const GRAVITY = 200.0
const WALK_SPEED = 200
var JUMP_SPEED
var cntr = 0

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	if !is_on_floor():
		cntr = 0 + cntr
		JUMP_SPEED = velocity.y+100
		print(cntr)
	else:
		cntr = 1
		JUMP_SPEED = 5
		print(cntr)
		
	if Input.is_action_pressed("ui_left") && cntr == 0:
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right") && cntr == 0:
		velocity.x =  WALK_SPEED
	elif Input.is_action_pressed("ui_up") && cntr == 0:
		velocity.y -=  JUMP_SPEED
	else:
		velocity.x = 0
		
	move_and_slide(velocity, Vector2(0, -1))
