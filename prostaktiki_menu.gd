extends Control

@onready var _singular: Button = %singular
@onready var _plural: Button = %plural
@onready var _quit_button: Button = %QuitButton
@onready var _back_button: Button = %BackButton

var main_scene := "res://Scenes/main.tscn"
var menu_scene := "res://Scenes/menu.tscn"

func _ready() -> void:
	_singular.pressed.connect(func() -> void:
		global.dictionary = ProstaktikiS
		get_tree().change_scene_to_file(main_scene)
	)
	_plural.pressed.connect(func() -> void:
		global.dictionary = ProstaktikiP
		get_tree().change_scene_to_file(main_scene)
	)

	_quit_button.pressed.connect(func() -> void:
		get_tree().quit()
	)
	_back_button.pressed.connect(func() -> void:
		get_tree().change_scene_to_file(menu_scene)
	)
