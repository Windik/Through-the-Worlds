extends Label

var current_scene
var counter = 0
var current_scene_check

func _ready():
	current_scene = get_tree().get_current_scene().get_name()
	current_scene_check = current_scene
	$Timer.start(0.2)

func _physics_process(delta):
	if current_scene_check != get_tree().get_current_scene().get_name():
		$Timer.stop()
		text = ""
		counter = 0
		current_scene = get_tree().get_current_scene().get_name()
		current_scene_check = current_scene
		$Timer.start(0.2)



func _on_Timer_timeout():
	if counter < len(GameManager.missions[current_scene]):
		text += GameManager.missions[current_scene][counter]
		counter += 1
		$AudioStreamPlayer.play()
