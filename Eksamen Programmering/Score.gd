extends Label

func _process(delta):
	$".".text = str(Manager.score)
