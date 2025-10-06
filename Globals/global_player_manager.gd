extends Node


signal interaction_pressed()


const PLAYER = preload("res://Entities/Player/player.tscn")


var player : Player
var player_spawned : bool


func _ready() -> void:
	player_spawned = false
	_create_player_instance()


func set_player_position(_new_position : Vector2) -> void:
	player.global_position = _new_position
	
	
func set_player_hp(_hp : int, _max_hp : int) -> void:
	player.health_component.hp = _hp
	player.health_component.max_hp = _max_hp
	player.health_component.update_health(0)
	

func set_player_parent(_parent : Node) -> void:
	if player.get_parent():
		player.get_parent().remove_child(player)
	_parent.add_child(player)


func remove_player_parent(_parent : Node) -> void:
	_parent.remove_child(player)


func _create_player_instance() -> void:
	player = PLAYER.instantiate()
	add_child(player)
