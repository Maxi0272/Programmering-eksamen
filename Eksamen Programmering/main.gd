extends Node2D
const std_platform = preload("res://standard_platform.tscn")
const dis_platform = preload("res://dissapearing_platform.tscn")
const moving_platform = preload("res://moving_platform.tscn")
const loss = preload("res://loss.tscn")
@onready var score = $CanvasLayer/Score
@onready var player = $Player
@onready var camera_2d = $Player/Camera2D
var old_platform_pos_y = 250


func _process(_delta):
	if player.position.y > camera_2d.limit_bottom:
		var loss_scene = loss.instantiate()
		loss_scene.position.y = camera_2d.limit_bottom - 800
		add_child(loss_scene)
		score.hide()


func platform_spawn():
	var chose = randi_range(1,3)

	if chose == 1:

		var dis_platform_scene = dis_platform.instantiate()
		dis_platform_scene.position = Vector2(randf_range(123,357),old_platform_pos_y)
		old_platform_pos_y = dis_platform_scene.position.y - 150
		add_child(dis_platform_scene)

	elif chose == 2:

		var std_platform_scene = std_platform.instantiate()
		std_platform_scene.position = Vector2(randf_range(123,357),old_platform_pos_y)
		old_platform_pos_y = std_platform_scene.position.y - 150
		add_child(std_platform_scene)

	elif chose == 3:

		var moving_platform_scene = moving_platform.instantiate()
		moving_platform_scene.position = Vector2(0,old_platform_pos_y)
		old_platform_pos_y = moving_platform_scene.position.y - 150
		add_child(moving_platform_scene)

func _on_timer_timeout():
	platform_spawn()
