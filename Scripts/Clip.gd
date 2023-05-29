extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	rotate_y(5 * delta)


func _on_Clip_body_entered(body):
	if body.name == "Player":
		if GameManager.clips < 10:
			GameManager.clips += 1
			queue_free()
