extends Node3D

@onready var battleLog = $Controls/BattleLog

func _ready():
	battleLog.text = ""
	battleLog.text += "Battle starts!"


func _process(_delta):
	pass


func testload():
	pass
