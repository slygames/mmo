@tool
extends Node2D

@onready var skin: Sprite2D = $Skin
@onready var clothes: Sprite2D = $Clothes
@onready var hair: Sprite2D = $Hair
@onready var eyes: Sprite2D = $Eyes
@onready var hat: Sprite2D = $Hat

@export var frame : int:
	set(_frame):
		frame = _frame
		update_sprite_frame(frame)

func _ready():
	print("READY")

func update_sprite_frame(_frame: int):
	skin.frame = _frame
	clothes.frame = _frame
	hair.frame = _frame
	eyes.frame = _frame
	hat.frame = _frame
