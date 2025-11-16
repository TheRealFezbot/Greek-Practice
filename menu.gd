extends Control

@onready var _mellontas: Button = %Mellontas
@onready var _aoristos: Button = %Aoristos
@onready var _quit_button: Button = %QuitButton

var mellontas_scene = "res://Scenes/mellontas.tscn"
var aoristos_scene = "res://Scenes/aoristos.tscn"

func _ready() -> void:
	_quit_button.pressed.connect(func() -> void:
		get_tree().quit()
	)
	_mellontas.pressed.connect(func() -> void:
		get_tree().change_scene_to_file(mellontas_scene)
	)
	_aoristos.pressed.connect(func() -> void:
		get_tree().change_scene_to_file(aoristos_scene)
	)
