extends MeshInstance3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mat = preload("res://Materials/text_active.tres")
@export (Material) var new_material
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.button_pressed == true:
			_doSomething()
			
func _doSomething():
	print("Start game")
	get_tree().change_scene_to_file("res://Levels/Lvl1.tscn")


func _on_Area_mouse_entered():
	print("Enter Start")
	set_surface_override_material(0, new_material)
	new_material.albedo_color = Color(0.9, 0, 0)
	

func _on_Area_mouse_exited():
	print("Exit Start")
	set_surface_override_material(0, new_material)
	new_material.albedo_color = Color(1, 1, 1)
	
