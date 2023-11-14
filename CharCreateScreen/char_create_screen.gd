extends Control

@export var nextScene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	regenerate()


func regenerate():
	PlayerStats.playerName = Globals.GenerateName()
	PlayerStats.className = Globals.GenerateClass()
	PlayerStats.maxHP = Globals.generateHP()
	PlayerStats.strength = Globals.generateStr()
	PlayerStats.agility = Globals.generateAgility()
	PlayerStats.toughness = Globals.generateToughness()
	$LabelsLeft/Name.text = PlayerStats.playerName
	$LabelsLeft/Class.text = PlayerStats.className
	$LabelsLeft/HP.text = "HP: " + str(PlayerStats.maxHP)
	$LabelsLeft/Strength.text = "Strength: " + str(PlayerStats.strength)
	$LabelsLeft/Agility.text = "Agility: " + str(PlayerStats.agility)
	$LabelsLeft/Toughness.text = "Toughness: " + str(PlayerStats.toughness)


func _on_reroll_pressed():
	regenerate()


func _on_run_pressed():
	get_tree().change_scene_to_packed(nextScene)
