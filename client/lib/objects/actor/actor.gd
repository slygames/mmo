extends CharacterBody2D
#class_name Actor

const packets := preload("res://lib/packets/packets.gd")

#const Scene := preload("res://lib/objects/actor/actor.tscn")
const Actor := preload("res://lib/objects/actor/actor.gd")

#const Body := preload("res://lib/objects/actor/body.tscn")

var actor_id: int
var actor_name: String
var start_x: float
var start_y: float
var speed: float
var is_player: bool

static func instantiate(actor_id: int, actor_name: String, x: float, y: float, speed: float, is_player: bool) -> Actor:
	#var actor := Scene.instantiate()
	var actor := Actor.new()
	actor.actor_id = actor_id
	actor.actor_name = actor_name
	actor.start_x = x
	actor.start_y = y
	#actor.start_rad = rad
	actor.speed = speed
	actor.is_player = is_player
	
	return actor
	
func _ready():
	position.x = start_x
	position.y = start_y
	
	velocity = Vector2.RIGHT * speed
	
	
func _physics_process(delta: float) -> void:
	position += velocity * delta
	
	if not is_player:
		return
	# Player-specific stuff below here
	
	var mouse_pos := get_global_mouse_position()
	
	var input_vec := position.direction_to(mouse_pos).normalized()
	if abs(velocity.angle_to(input_vec)) > TAU / 15: 
		velocity = input_vec * speed
		var packet := packets.Packet.new()
		var player_direction_msg := packet.new_player_direction()
		player_direction_msg.set_direction(velocity.angle())
		WS.send(packet)
	
#func _draw() -> void:
#	draw_circle(Vector2.ZERO, _collision_shape.radius, Color.DARK_ORCHID)

func _tool_use_emit():
	print('_tool_use_emit()')
