extends "res://lib/objects/actor/actor.gd"

@onready var _nameplate: Label = $Player/Nameplate
@onready var _camera: Camera2D = $Player/Camera2D

func _ready():
	_nameplate.text = actor_name

func _input(event: InputEvent) -> void:
	if is_player and event is InputEventMouseButton and event.is_pressed():
		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				_camera.zoom.x = min(4, _camera.zoom.x + 0.1)
			MOUSE_BUTTON_WHEEL_DOWN:
				_camera.zoom.x = max(0.1, _camera.zoom.x - 0.1)
		_camera.zoom.y = _camera.zoom.x
