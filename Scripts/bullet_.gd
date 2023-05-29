extends RigidBody

export var speed = 30
export var damage = 30

func _physics_process(delta):
	translation -= global_transform.basis.z * speed * delta




func _on_Area_body_entered(body):
	pass
	#if body.name == "GatesDoor":
	#	if body.HP > 0:
	#		body.HP -= damage
	#		print("Damage Gates")
	#		queue_free()
	#	else:
	#		body.queue_free()
