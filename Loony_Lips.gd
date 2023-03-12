extends Control

var player_words=[]
var story="Once upon a time %s watched %s and was it's %s movie of %s year."
var prompts=["a name","a noun","adverb","adjective"]

@onready var PlayerText=$VBoxContainer/HBoxContainer/PlayerText
@onready var DisplayText=$VBoxContainer/DisplayText
@onready var LableForButtonText=$VBoxContainer/HBoxContainer/LabelForButton

func _ready():
	DisplayText.text="Welcome ! "
	check_player_words_length()
	PlayerText.grab_focus()

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text=""
	PlayerText.clear()
	check_player_words_length()

func is_story_done():
	return player_words.size() == prompts.size()

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()

func tell_story():
	DisplayText.text=story %player_words
	
func prompt_player():
	DisplayText.text+="May I have "+prompts[player_words.size()] + " please?"


func _on_player_text_text_submitted(new_text):
	if is_story_done():
		end_game()
	else:
		add_to_player_words()
	
func end_game():
	PlayerText.queue_free()
	tell_story()
	LableForButtonText.text="Again"
