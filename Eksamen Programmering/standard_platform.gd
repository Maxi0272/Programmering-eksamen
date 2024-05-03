extends StaticBody2D
@onready var camera_2d = $"../Player/Camera2D"
@onready var area_2d = $Area2D

func _process(delta):
	if camera_2d.limit_bottom < position.y:
		queue_free()

func _on_area_2d_area_entered(area):
	Manager.score += 1
	area_2d.set_deferred("monitoring",false)
