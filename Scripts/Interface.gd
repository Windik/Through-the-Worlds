extends CanvasLayer
# Есть ли предмет в ячейке
var cell1_item1 = ""
var cell2_item2 = ""
var cell3_item3 = ""
var cell4_item4 = ""
# Текстуры
var old_key = preload("res://Images/Key_Item_Low_96.png")
# Переменные для отображения предмета
var item1
var item2
var item3
var item4

var invis = false

func invis():
	$Bullets.visible = false
	$Money.visible = false
	$BulletsIcon.visible = false
	$MoneyIcon.visible = false
	$HPIcon.visible = false
	$HP.visible = false
	$Inventory.visible = false
	invis = true

func vis():
	$Bullets.visible = true
	$Money.visible = true
	$BulletsIcon.visible = true
	$MoneyIcon.visible = true
	$HPIcon.visible = true
	$HP.visible = true
	$Inventory.visible = true
	invis = false

func _ready():
	if get_tree().current_scene.name == "Menu":
		invis()
		invis = true
	item1 = find_node("Item1")
	item2 = find_node("Item2")
	item3 = find_node("Item3")
	item4 = find_node("Item4")

func _on_transfer_value(value):
	cell1_item1 = value

func _physics_process(delta):
	if get_tree().current_scene.name == "Menu":
		invis()
	else:
		vis()
	if cell1_item1 == "OldKey":
		item1.set_texture(old_key)
	
