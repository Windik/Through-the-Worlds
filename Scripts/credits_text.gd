extends MeshInstance

var mat = preload("res://Materials/text_active.tres")
export (Material) var new_material
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			new_material.albedo_color = Color(1, 1, 1)
			_doSomething()
			
func _doSomething():
	print("Show credits")
	get_tree().change_scene("res://Levels/Credits.tscn")

func _on_Area_mouse_entered():
	print("Credits")
	set_surface_material(0, new_material)
	new_material.albedo_color = Color(0.9, 0, 0)

func _on_Area_mouse_exited():
	new_material.albedo_color = Color(1, 1, 1)


