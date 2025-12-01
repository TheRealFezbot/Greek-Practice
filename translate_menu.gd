extends Control

@onready var _rimata_a: Button = %rimataA
@onready var _rimata_b: Button = %rimataB
@onready var _rimata_e: Button = %rimataE
@onready var _rimata_all: Button = %rimata_all

@onready var _quit_button: Button = %QuitButton
@onready var _back_button: Button = %BackButton

var main_scene := "res://Scenes/main.tscn"
var menu_scene := "res://Scenes/menu.tscn"

func _ready() -> void:
	_rimata_a.pressed.connect(func() -> void:
		global.dictionary = TranslateA
		get_tree().change_scene_to_file(main_scene)
	)
	_rimata_b.pressed.connect(func() -> void:
		global.dictionary = TranslateB
		get_tree().change_scene_to_file(main_scene)
	)
	_rimata_e.pressed.connect(func() -> void:
		global.dictionary = TranslateE
		get_tree().change_scene_to_file(main_scene)
	)
	_rimata_all.pressed.connect(func() -> void:
		global.dictionary = TranslateAll
		get_tree().change_scene_to_file(main_scene)
	)
	_quit_button.pressed.connect(func() -> void:
		get_tree().quit()
	)
	_back_button.pressed.connect(func() -> void:
		get_tree().change_scene_to_file(menu_scene)
	)
