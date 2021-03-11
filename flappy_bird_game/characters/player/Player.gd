extends RigidBody2D

export var FLAP_FORCE = -300

const MAX_ROTATION_DEGREE = -40

onready var animator = $AnimationPlayer

var started = false

func _physics_process(delta) -> void:
	if Input.is_action_just_pressed("flap"):
		if !started:
			start()
		flap()
		
	if rotation_degrees <= MAX_ROTATION_DEGREE:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGREE
		
	if linear_velocity.y > 0:
#		if rotation_degrees <= 90:
#			angular_velocity = 3
		if linear_velocity.y > 0:
			angular_velocity = 1
	
func start():
	if started: return
	started = true
	gravity_scale = 7.0
	animator.play("flap")

func flap():
	linear_velocity.y = FLAP_FORCE
	angular_velocity = -8
