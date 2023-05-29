extends Area

var hints
var gates
var gates_open = false
var near_terminal = false
var near_bunker_entrence = false
var near_tower_door = false
var oldKeyTrigger = false
var oldKey = null
var oldKeyInInventory = false
var portalTrigger = false

signal cell1_item1  ###############

var fall = Vector3.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().current_scene.name == "Lvl_1":
		gates = $"../../GatesDoor"
	hints = Interface.get_node("Hints")  # get_tree().get_root().find_node("Hints")
	connect("cell1_item1", Interface, "_on_transfer_value") ##############
	

func _physics_process(delta):
	if near_terminal:
		if (Input.is_action_just_pressed("interaction")):
			gates_open = true
	if near_bunker_entrence:
		if (Input.is_action_just_pressed("interaction")):
			get_tree().change_scene("res://Levels/Lvl_2.tscn")
	if portalTrigger:
		if (Input.is_action_just_pressed("interaction")):
			get_tree().change_scene("res://Levels/Home_Dimension.tscn")
	if get_tree().current_scene.name == "Lvl_1":
		if gates_open:
			# print(gates.transform.origin.y)
			if gates.transform.origin.y < 4:
				fall.y += 0.01 * delta
				gates.move_and_slide(fall, Vector3.UP)
	if oldKeyTrigger:  ##################
		if (Input.is_action_just_pressed("interaction")):  #############
			oldKey.queue_free()  ############
			# inventory.cell1_item1 = "OldKey"
			emit_signal("cell1_item1", "OldKey")  ##############
			oldKeyTrigger = false  ############
			oldKeyInInventory = true
			Achivement.geted_achive = "SEEKER"
			Achivement.is_get_achive = true
	if near_tower_door:
		if oldKeyInInventory:
			if (Input.is_action_just_pressed("interaction")):
				Interface.cell1_item1 = ""
				get_tree().change_scene("res://Levels/Lvl_tower.tscn")
		
				

				
# Взаимодействие игрока с указанными объектами
func _on_PlayerArea_body_entered(body):  ####################
	if body.name == "Terminal":
		hints.visible = true
		hints.text = "Press 'E' to open Gates"
		near_terminal = true
	if body.name == "StairsEntrence":
		hints.visible = true
		hints.text = "I must move forward.\nThis humans can catch me again..."
	if body.name == "ReturnWall":
		hints.visible = true
		hints.text = "I can't waste my time!\nI need to find the bunker and get home..."
	if body.name == "Portal":
		hints.visible = true
		hints.text = "Finaly I can return to my dimension!\nI need press E to use it..."
		portalTrigger = true
	if body.name == "GatesDoor":
		hints.visible = true
		hints.text = "Need to find the Terminal to open Gates..."
	if body.name == "BunkerEntrence":
		hints.text = "Let's go to the bunker..."
		hints.visible = true
		near_bunker_entrence = true
	if body.name == "TowerDoor":
		near_tower_door = true
		if Interface.cell1_item1 != "OldKey":
			hints.text = "Looks closed"
			hints.visible = true
		else:
			hints.text = "Now I can use old key"
			hints.visible = true
	if body.name == "OldKey":  #################
		hints.text = "Maybe this key will open Tower Door..."
		hints.visible = true
		oldKeyTrigger = true  ########################
		oldKey = body  #################


func _on_PlayerArea_body_exited(body):
	if body.name in ["Terminal", "GatesDoor", "BunkerEntrence", "TowerDoor", "OldKey", "StairsEntrence", "Portal", "ReturnWall"]:
		hints.visible = false
		hints.text = "Nothing to do with it"
		if body.name == "OldKey":
			oldKeyTrigger = false
