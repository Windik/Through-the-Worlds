extends MeshInstance

onready var bullet = load("res://Prefabs/bullet_.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot") and GameManager.bullets > 0:
		GameManager.bullets -= 1
		var bulletInstance = bullet.instance()
		bulletInstance.global_transform = $Position3D.global_transform
		$Shoot.play()
		get_tree().get_root().add_child(bulletInstance)
	if Input.is_action_just_pressed("reload") and GameManager.clips > 0 and GameManager.bullets <= 0:
		GameManager.clips -= 1
		GameManager.bullets = 12
