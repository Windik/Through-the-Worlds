extends Label


func _physics_process(delta):
	text = str(GameManager.bullets) + "/" + str(GameManager.clips)
