extends Control

@export var zoneName: String


func _ready():
	$AnimationPlayer.play("fade")
	$Label.text = zoneName
	$Label2.text = zoneName


