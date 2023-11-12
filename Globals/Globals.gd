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
var preClassArray = ["Damned", "Shallow", "Giant", "Slow", "Spiked", "Weak",
"Rough", "Colossal", "Filthy", "Drunk", "Last", "Poisonous", "Undying", "Cold",
"Silent", "Bloody", "Beast", "Dark", "Blind", "Cursed", "Dying", "Forgotten"]
var postClassArray = ["warlock", "knight", "blade", "hunter", "cultist", "rogue",
"thief", "necromancer"]
func GenerateClass():
	var playerClass = preClassArray.pick_random() + " " + postClassArray.pick_random()
	return playerClass
