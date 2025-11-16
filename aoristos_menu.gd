extends Control

@onready var _aoristos_a: Button = %AoristosA
@onready var _aoristos_b: Button = %AoristosΒ
@onready var _aoristos_e: Button = %AoristosΕ
@onready var _aoristos_all: Button = %AoristosAll
@onready var _quit_button: Button = %QuitButton
@onready var _back_button: Button = %BackButton


var main_scene := "res://Scenes/main.tscn"
var menu_scene := "res://Scenes/menu.tscn"

func _ready() -> void:
	_aoristos_a.pressed.connect(func() -> void:
		global.dictionary = AoristosA
		get_tree().change_scene_to_file(main_scene)
	)
	_aoristos_b.pressed.connect(func() -> void:
		global.dictionary = AoristosB
		get_tree().change_scene_to_file(main_scene)
	)
	_aoristos_e.pressed.connect(func() -> void:
		global.dictionary = AoristosE
		get_tree().change_scene_to_file(main_scene)
	)
	_aoristos_all.pressed.connect(func() -> void:
		global.dictionary = AoristosAll
		get_tree().change_scene_to_file(main_scene)
	)
	_quit_button.pressed.connect(func() -> void:
		get_tree().quit()
	)
	_back_button.pressed.connect(func() -> void:
		get_tree().change_scene_to_file(menu_scene)
	)
