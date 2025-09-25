@tool
class_name AreaWallCheck extends Area2D

enum SIDE {up,down,left,right}


@export var side : SIDE :
	set(_v):
		side = _v
		_update_size()
		

var npc_wander_behavior : NPCWanderBehavior


@onready var collision_shape: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	if get_parent() is NPCWanderBehavior:
		npc_wander_behavior = get_parent() as NPCWanderBehavior
		print("trovato")
	if Engine.is_editor_hint():
		return

func _update_size() -> void:
	
	if !npc_wander_behavior:
		return

	print("less")
	var _new_size : Vector2
	var _new_position := Vector2.ZERO
	
	match side:
		SIDE.up:
			_new_size = Vector2(32,npc_wander_behavior.wander_range)
			_new_position.y -= _new_size.y / 2
		SIDE.down:
			_new_size = Vector2(32,npc_wander_behavior.wander_range)
			_new_position.y += _new_size.y / 2
		SIDE.left:
			_new_size = Vector2(npc_wander_behavior.wander_range,32)
			_new_position.x += _new_size.y / 2
		SIDE.right:
			_new_size = Vector2(npc_wander_behavior.wander_range,32)
			_new_position.x -= _new_size.y / 2
			
	if !collision_shape:
		collision_shape = get_node("CollisionShape2D")
		
	collision_shape.position = _new_position
	collision_shape.scale = _new_size
