extends KinematicBody2D


const UP = Vector2(0,-1)
const JUMP_HEIGHT = -500
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$sprite.flip_h = false
		$sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$sprite.flip_h = true
		$sprite.play("run")
	else:
		motion.x = 0
		friction = true
		$sprite.play("idle")

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
			
	else:
		if motion.y < 0 :
			$sprite.play("jump")
		else:
			$sprite.play("fall")
		
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		
	motion = move_and_slide(motion,UP)
	pass

