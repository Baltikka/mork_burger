extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	regenerate()


func regenerate():
	$Name.text = Globals.GenerateName()
	$Class.text = Globals.GenerateClass()


func _on_reroll_pressed():
	regenerate()
