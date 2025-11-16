extends Control


# import important nodes as variables
# # Common
@onready var _audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer
@onready var _quit_button: Button = %QuitButton
@onready var _menu_button: Button = %MenuButton

# # Main
@onready var _word_a: Label = %word_A
@onready var _word_meaning: Label = %word_meaning
@onready var _user_input: LineEdit = %user_input
@onready var _counter_label: Label = %CounterLabel
# # Correction
@onready var _correction_c_rect: ColorRect = %CorrectionCRect
@onready var _correction_c_container: CenterContainer = %CorrectionCContainer
@onready var _wrong_label: Label = %WrongLabel
@onready var _user_label: Label = %UserLabel
@onready var _correction_label: Label = %CorrectionLabel
@onready var _continue_button: Button = %ContinueButton

# import sounds
const CORRECT = preload("uid://bhuc47qnbqoxw")
const WRONG = preload("uid://duedungmi4ojk")

# Set the correct word list (name.list = word list)
@export var dictionary := global.dictionary
# Set the defintion
@export var definition = global.definition

func _ready() -> void:
	_quit_button.pressed.connect(func() -> void:
		get_tree().quit()
	)
	_menu_button.pressed.connect(func() -> void:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	)
	_start_test()

func _start_test() -> void:
	# Create an array of all the words
	var queue = dictionary.list.keys()
	
	_user_input.keep_editing_on_text_submit = true
	
	# Keep running as long as there are words in the queue
	while queue.size() > 0:
		# set the input bar as focus so the user can type immediately 
		_user_input.grab_focus()
		# turn correction screen invisible
		_correction_c_container.visible = false
		_correction_c_rect.visible = false
		# get the first word in the queue
		var word = queue.pop_front() 
		
		# set correct counter
		_counter_label.text = "Words left: " + str(queue.size())
		# set label text as the word to translate
		_word_a.text = word
		# set definition as list definition
		_word_meaning.text = definition
		
		# get the user answer and save it to a variable to compare
		var submitted_text = await _user_input.text_submitted
		# clear the user_input text
		_user_input.clear()
		
		# compare text
		if submitted_text.to_lower() == dictionary.list[word].to_lower():
			print("correct")
			_audio_stream_player.stream = CORRECT
			_audio_stream_player.play()
		else:
			print("incorrect")
			_audio_stream_player.stream = WRONG
			_audio_stream_player.play()
			_correction_c_container.visible = true
			_correction_c_rect.visible = true
			_user_label.text = "You answered: " + submitted_text
			_correction_label.text = "The correct answer is: " + dictionary.list[word]
			_continue_button.grab_focus()
			await _continue_button.pressed
			
			queue.append(word)
	if queue.size() == 0:
		_correction_c_container.visible = true
		_correction_c_rect.visible = true
		_wrong_label.visible = false
		_user_label.text = "Congratulations!"
		_correction_label.text = "You completed the list!"
		_continue_button.grab_focus()
		_continue_button.pressed.connect(func() -> void:
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		)
		await _continue_button.pressed
		
