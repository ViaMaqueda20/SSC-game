@tool
class_name LevelTransition extends Node2D

enum Sides {UP,DOWN,LEFT,RIGHT}


@export_category("Transition Settings")

@export_file("*.tscn") var target_level
@export var target_transition : String

 
@export_category("Collision Shape Setting")

@export var side := Sides.DOWN :
	set(_v):
		side = _v
		_update_size()

@export_range(1,12,1,"or_greater") var size : int = 3 :
	set(_v):
		size = _v
		_update_size()
		
@export var snap_to_grid : bool :
	set(_v):
		snap_to_grid = _v
		_snap()

@onready var transition_area: Area2D = $TransitionArea
@onready var transition_collision_shape: CollisionShape2D = $TransitionArea/CollisionShape2D
@onready var collision_shape : CollisionShape2D = $CollisionShape2D
@onready var sprite: Sprite2D = $Sprite2D


func _ready() -> void:
	_update_size()
	if Engine.is_editor_hint():
		return
	
	_place_player()
	transition_area.monitoring = false
	sprite.visible = false
	
	await LevelManager.level_loaded
	
	transition_area.monitoring = true
	transition_area.body_entered.connect(_on_player_entered)


func _update_size() -> void:
	
	var _position := Vector2.ZERO
	var _new_size := Vector2.ONE
	var _spawn_position := Vector2.ZERO
	
	match side:
		Sides.UP:
			_position.y -= 16
			_new_size.x = size
			_spawn_position = Vector2(0,16)
		Sides.DOWN:
			_position.y += 16
			_new_size.x = size
			_spawn_position = Vector2(0,-16)
		Sides.LEFT:
			_position.x -= 16
			_new_size.y = size
			_spawn_position = Vector2(16,0)
		Sides.RIGHT:
			_position.x += 16
			_new_size.y = size
			_spawn_position = Vector2(-16,0)
	
	if transition_collision_shape == null:
		transition_collision_shape = get_node("TransitionArea/CollisionShape2D")
	if collision_shape == null:
		collision_shape = get_node("CollisionShape2D")
	if sprite == null:
		sprite = get_node("Sprite2D")

	transition_collision_shape.position = _position
	transition_collision_shape.scale = _new_size
	collision_shape.position = _position
	collision_shape.scale = _new_size
	sprite.position = _spawn_position
	
func _on_player_entered(_n : Node2D) -> void:
	LevelManager.load_new_level(target_level,target_transition)
	
func _place_player() -> void:
	if name == LevelManager.target_transition:
		PlayerManager.set_player_position(sprite.global_position)



func _snap() -> void:
	position = (position / 32).round() * 32
	
