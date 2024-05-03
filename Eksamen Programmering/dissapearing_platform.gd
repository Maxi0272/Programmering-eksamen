extends StaticBody2D
@onready var timer = $Timer
@onready var color_rect = $ColorRect
@onready var area_2d = $Area2D
@onready var camera_2d = $"../Player/Camera2D"


func _process(delta):
	if timer.time_left > 3:
		color_rect.color = Color(0,255,0)
	elif timer.time_left > 2:
		color_rect.color = Color(255,165,0)
	elif timer.time_left > 1:
		color_rect.color = Color(255,0,0)

	if camera_2d.limit_bottom < position.y:
		queue_free()

func _on_area_2d_area_entered(area):
	timer.start()
	Manager.score += 1
	area_2d.set_deferred("monitoring",false)

func _on_timer_timeout():
	queue_free()
