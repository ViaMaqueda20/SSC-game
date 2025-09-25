@tool
class_name NPC extends CharacterBody2D


signal behavior_enabled()

const DIR_VEC = [Vector2.RIGHT,Vector2.DOWN,Vector2.LEFT,Vector2.UP]

var direction : Vector2
var cardinal_direction : Vector2
var original_position : Vector2
var collision_info : KinematicCollision2D
var is_behavior_enabled : bool


@export var npc_data : NPCResource : set = _set_npc_resource

@onready var sprite: Sprite2D  = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	_setup()
	if Engine.is_editor_hint():
		return
	
	direction = Vector2.ZERO
	cardinal_direction = Vector2.DOWN
	original_position = global_position
	
	is_behavior_enabled = true
	behavior_enabled.emit()


func _physics_process(_delta: float) -> void:
	collision_info = move_and_collide(velocity * _delta)


func _setup() -> void:
	if npc_data and sprite:
		sprite.texture = npc_data.sprite
		

func _set_npc_resource(_npc_res : NPCResource) -> void:
	npc_data = _npc_res
	_setup()
	

func update_direction() -> bool:
	if direction == Vector2.ZERO:
		return false
	
	var new_cardinal_direction : Vector2 = DIR_VEC[int(round((direction+cardinal_direction*0.1).angle()/TAU*DIR_VEC.size()))] 

	if cardinal_direction == new_cardinal_direction:
		return false
	
	sprite.scale.x = -1 if direction.x<0 else 1
	cardinal_direction=new_cardinal_direction
	
	return true


func update_animation(state : String) -> void:
	animation_player.play(state + "_" + _vector_to_direction())


func _vector_to_direction() -> String:
	if cardinal_direction==Vector2.DOWN:
		return "down"
	elif cardinal_direction==Vector2.UP: 
		return "up"
	else:
		return "side"
