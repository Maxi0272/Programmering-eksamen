extends Camera2D
var old_pos = 0

func _process(delta):
	var position_check = old_pos - $"..".position.y
	if position_check > 40:
		limit_bottom -= position_check
		old_pos = $"..".position.y
