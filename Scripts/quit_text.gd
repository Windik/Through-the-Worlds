extends MeshInstance

var mat = preload("res://Materials/text_active.tres")
export (Material) var new_material
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			_doSomething()
			
func _doSomething():
	print("Quit game")
	get_tree().quit()


func _on_Area_mouse_entered():
	set_surface_material(0, new_material)
	new_material.albedo_color = Color(0.9, 0, 0)
	

func _on_Area_mouse_exited():
	set_surface_material(0, new_material)
	new_material.albedo_color = Color(1, 1, 1)
