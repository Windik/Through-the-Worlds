extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mat = preload("res://Materials/text_active.tres")
export (Material) var new_material
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			_doSomething()
			
func _doSomething():
	print("Start game")
	get_tree().change_scene("res://Levels/Lvl1.tscn")


func _on_Area_mouse_entered():
	print("Enter Start")
	set_surface_material(0, new_material)
	new_material.albedo_color = Color(0.9, 0, 0)
	

func _on_Area_mouse_exited():
	print("Exit Start")
	set_surface_material(0, new_material)
	new_material.albedo_color = Color(1, 1, 1)
	
