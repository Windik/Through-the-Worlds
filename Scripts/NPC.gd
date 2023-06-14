extends CharacterBody3D

var path = []
var path_node = 0
var fall = Vector3.ZERO
var speed = 1
@onready var nav = get_parent()
func _physics_process(delta):
	if path_node < path.size():
		var dir = (path[path_node] - global_transform.origin)
		look_at(dir, Vector3.UP)
		if dir.length() < 1:
			path.node += 1
		else:
			set_velocity(dir.normalized() * speed)
			set_up_direction(Vector3.UP)
			move_and_slide()
	fall.y -= 10
	set_velocity(fall)
	move_and_slide()
func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0
var radius = 100
func _on_Timer_timeout():
	var random_position = Vector3(randf_range(-radius, radius), 0, randf_range(-radius, radius))
	move_to(random_position)
