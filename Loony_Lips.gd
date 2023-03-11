extends Control


func _ready():
	var prompts=["Yann","Minions","greatest","2000"]
	var story="Once upon a time %s watched %s and was it's %s movie of %s year."
	print(story %prompts)

	$DisplayText.text=story %prompts
