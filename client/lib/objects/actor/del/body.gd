extends Node2D

@export var _textures : Array[Texture2D]

@export var hframes : int:
	set(_hframes):
		hframes = _hframes
		_update_sprites()
		
@export var vframes : int:
	set(_vframes):
		vframes = _vframes
		_update_sprites()
	
@export var frame : int:
	set(_frame):
		frame = _frame
		_update_sprites()

@export var frame_coords : Vector2i:
	set(_frame_coords):
		frame_coords = _frame_coords
		_update_sprites()

func _update_sprites():
	var sprites := get_children() as Array[Sprite2D]
	for sprite in sprites:
		sprite.hframes = hframes
		sprite.vframes = vframes
		sprite.frame = frame
		sprite.frame_coords = frame_coords
