extends Node
# names & nameGen
var firstNameArray = ["Egh", "Arven", "Balam", "Mogh", "Krat", "Aard", "Arnt",
"Bozdar", "Jotam", "Joz", "Anar", "Manno"]
var lastNameArray = ["Paol", "Brot", "Kori", "Sherch", "Khar", "Mard", "Nik",
"Aban"]
func GenerateName():
	var playerName = firstNameArray.pick_random() + " " + lastNameArray.pick_random()
	return playerName

#class & classGen
var preClassArray = ["Damned", "Giant", "Slow", "Spiked", "Weak",
"Rough", "Colossal", "Filthy", "Drunk", "Last", "Poisonous", "Undying", "Cold",
"Silent", "Bloody", "Beast", "Dark", "Blind", "Cursed", "Dying", "Forgotten", "Mad"]
var postClassArray = ["warlock", "knight", "blade", "hunter", "cultist", "rogue",
"thief", "necromancer", "marauder"]
func GenerateClass():
	var playerClass = preClassArray.pick_random() + " " + postClassArray.pick_random()
	return playerClass
#generating stats
func generateHP():
	var hpRoll = randi_range(3, 7)
	return hpRoll
func generateStr():
	var strRoll = randi_range(-3, 3)
	return strRoll
func generateAgility():
	var agiRoll = randi_range(-3, 3)
	return agiRoll
func generateToughness():
	var toughRoll = randi_range(0, 3)
	return toughRoll
