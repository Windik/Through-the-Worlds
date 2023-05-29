extends TextureRect

var f_1 = preload("res://Icons/faces/face_1.png")
var f_2 = preload("res://Icons/faces/face_2.png")
var f_3 = preload("res://Icons/faces/face_3.png")
var f_4 = preload("res://Icons/faces/face_4.png")

func _physics_process(delta):
	if GameManager.hp > 80:
		texture = f_1
	if GameManager.hp <= 80 and GameManager.hp > 60:
		texture = f_2
	if GameManager.hp <= 60 and GameManager.hp > 30:
		texture = f_3
	if GameManager.hp <= 30:
		texture = f_4
