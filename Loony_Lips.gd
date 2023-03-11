extends Control


func _ready():
	var prompts=["Yann","Minions","greatest","2000"]
	var story="Once upon a time %s watched %s and was it's %s movie of %s year."
	print(story %prompts)

	$VBoxContainer/DisplayText.text= story %prompts


func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)
	
func _on_TextureButton_pressed():
	var words=$VBoxContainer/HBoxContainer/PlayerText.text
	update_DisplayText(words)

func update_DisplayText(new_text):
	$VBoxContainer/DisplayText.text= new_text
	$VBoxContainer/HBoxContainer/PlayerText.clear()


