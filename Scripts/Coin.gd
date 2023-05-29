extends Area


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	rotate_y(5 * delta)

func _on_Area_body_entered(body):
	if body.name == "Player":
		GameManager.money += 20
		queue_free()
