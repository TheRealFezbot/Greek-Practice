extends Control

@onready var _mellontas: Button = %Mellontas
@onready var _aoristos: Button = %Aoristos
@onready var _translate: Button = %Translate
@onready var _quit_button: Button = %QuitButton
@onready var _prostaktiki: Button = %Prostaktiki

var mellontas_scene = "res://Scenes/mellontas.tscn"
var aoristos_scene = "res://Scenes/aoristos.tscn"
var translate_scene = "res://Scenes/translate.tscn"
var prostaktiki_scene = "res://Scenes/prostaktiki.tscn"

func _ready() -> void:
	_quit_button.pressed.connect(
		func() -> void:
			get_tree().quit()
	)
	_mellontas.pressed.connect(
		func() -> void:
			get_tree().change_scene_to_file(mellontas_scene)
	)
	_aoristos.pressed.connect(
		func() -> void:
			get_tree().change_scene_to_file(aoristos_scene)
	)
	_prostaktiki.pressed.connect(
		func() -> void:
			get_tree().change_scene_to_file(prostaktiki_scene)
	)
	_translate.pressed.connect(
		func() -> void:
			get_tree().change_scene_to_file(translate_scene)
	)
