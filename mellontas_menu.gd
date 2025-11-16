extends Control

@onready var _mellontas_a: Button = %MellontasA
@onready var _mellontas_b: Button = %MellontasΒ
@onready var _mellontas_e: Button = %MellontasΕ
@onready var _mellontas_all: Button = %MellontasAll
@onready var _quit_button: Button = %QuitButton
@onready var _back_button: Button = %BackButton

var main_scene := "res://Scenes/main.tscn"
var menu_scene := "res://Scenes/menu.tscn"

func _ready() -> void:
	_mellontas_a.pressed.connect(func() -> void:
		global.dictionary = MellontasA
		get_tree().change_scene_to_file(main_scene)
	)
	_mellontas_b.pressed.connect(func() -> void:
		global.dictionary = MellontasB
		get_tree().change_scene_to_file(main_scene)
	)
	_mellontas_e.pressed.connect(func() -> void:
		global.dictionary = MellontasE
		get_tree().change_scene_to_file(main_scene)
	)
	_mellontas_all.pressed.connect(func() -> void:
		global.dictionary = MellontasAll
		get_tree().change_scene_to_file(main_scene)
	)
	_quit_button.pressed.connect(func() -> void:
		get_tree().quit()
	)
	_back_button.pressed.connect(func() -> void:
		get_tree().change_scene_to_file(menu_scene)
	)
