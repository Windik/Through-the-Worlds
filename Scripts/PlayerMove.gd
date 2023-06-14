extends CharacterBody3D

@export var mouse_sensitivity = 0.06
@export var fall = Vector3()
@export var gravity = 0.05
@export var jump = 2
@export var speed = 1.5
@export var normal_speed = 1.5
@export var shift_speed = 3

func _physics_process(delta):
	var direction = Vector3()
	if (Input.is_action_pressed("run")):
		speed = shift_speed
	else:
		speed = normal_speed
	if (Input.is_action_pressed("ui_right")):
		direction += transform.basis.x * speed
	if (Input.is_action_pressed("ui_left")):
		direction -= transform.basis.x * speed
	if (Input.is_action_pressed("ui_up")):
		direction -= transform.basis.z * speed
	if (Input.is_action_pressed("ui_down")):
		direction += transform.basis.z * speed
	if (Input.is_action_pressed("exit")):
		get_tree().quit()
		
	set_velocity(direction)
	set_up_direction(Vector3.UP)
	move_and_slide()
	set_velocity(fall)
	set_up_direction(Vector3.UP)
	move_and_slide()
	if !is_on_floor():
		fall.y -= gravity
	if (Input.is_action_just_pressed("ui_accept") and is_on_floor()):
		fall.y = jump
	
func _input(event): # функция, проверяющая события ввода
	if event is InputEventMouseMotion: # если событие - движение мышкой
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity)) 
		$Camera3D.rotate_x(deg_to_rad(-event.relative.y * mouse_sensitivity))
		
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
