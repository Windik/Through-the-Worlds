extends TextureRect

var start_pos_y = 602
var start_pos_x = 723
var current_pos_y = 602
var current_pos_x = 723
var end_pos_y
export var get_achive = false
var windw
var show_speed = 40
var start_timer = false

# Called when the node enters the scene tree for the first time.
func _ready():
	windw = OS.get_window_size()
	
	start_pos_y = windw[1] + 50
	start_pos_x = windw[0] - 300
	current_pos_x = start_pos_x
	current_pos_y = start_pos_y
	end_pos_y = windw[1] - 50
	set_position(Vector2(start_pos_x, start_pos_y))

func show_achive(frames):
	if	current_pos_y > end_pos_y:
		current_pos_y -= show_speed * frames
		set_position(Vector2(current_pos_x, current_pos_y))
	if current_pos_y <= end_pos_y and start_timer == false:
		print("End point")
		$"../Timer".start()
		start_timer = true
	if Achivement.geted_achive == "SEEKER":
		$AchiveTitle.text = Achivement.geted_achive
		$AchiveText.text = Achivement.achives_collected["SEEKER"][1]
		Achivement.achives_collected["SEEKER"][0] = true
		Achivement.geted_achive = ""
		print(get_achive)

func _physics_process(delta):
	if Achivement.is_get_achive:
		show_achive(delta)

func _on_Timer_timeout():
	print("start timer")
	Achivement.is_get_achive = false
	current_pos_y = start_pos_y
	set_position(Vector2(current_pos_x, current_pos_y))
	$"../Timer".stop()
