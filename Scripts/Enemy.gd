extends CharacterBody3D

@onready var player = get_parent().get_parent().get_node("Player")
var speed = 1.8
var distance = 10
var atackDistance = 1.8
var hp = 100

var path = []
var path_node = 0
var fall = Vector3.ZERO
var radius = 100

var playerGetDamage = preload("res://Sounds/dsplpain.wav")
@onready var anim =$"Mutant Run (1)/RootNode/AnimationPlayer"
@onready var nav = get_parent()

func _physics_process(delta):
	var player_origin = player.get_global_transform().origin
	var enemy_origin = get_global_transform().origin
	var offset = player_origin - enemy_origin
	look_at(player_origin, Vector3.UP)
	if enemy_origin.distance_to(player_origin) < distance and enemy_origin.distance_to(player_origin) > atackDistance:
		anim.play("Run1")
		move_and_collide(offset.normalized() * speed * delta)
	elif enemy_origin.distance_to(player_origin) > distance:
		anim.play("IDLE")
	if  enemy_origin.distance_to(player_origin) < atackDistance:
		anim.play("Attack1")
		
	# Random move
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


func _on_Timer_timeout():
	var random_position = Vector3(randf_range(-radius, radius), 0, randf_range(-radius, radius))
	move_to(random_position)



func _on_Area_body_entered(body):
	if "bullet" in body.name:
		if hp > 0:
			hp -= 20
			body.queue_free()
		else:
			body.queue_free()
			queue_free()
	#Меняем здоровье игрока
	if body.name == "Player":
		if GameManager.hp > 1:
			GameManager.hp -= 10
			get_parent().get_parent().get_node("Sounds").play()
		else:
			get_tree().quit()
