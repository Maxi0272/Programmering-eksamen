extends Label

func _ready():
	$".".text = "Your score: " + str(Manager.score)
