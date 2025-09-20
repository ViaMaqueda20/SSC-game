extends PlayerState


@export var _animation_name := "walk"
@export var _speed : float = 100.0


@onready var idle : PlayerState = $"../Idle"
@onready var attack : PlayerState = $"../Attack"


func enter() -> void:
	player.update_animation(_animation_name)


func process(_delta: float) -> PlayerState:
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * _speed
	
	if player.set_card_direction():
		player.update_animation(_animation_name)
	return null


func handle_input(_event : InputEvent) -> PlayerState:
	if(_event.is_action_pressed("key_attack")):
		return attack
	#if(_event.is_action_pressed("key_interact")):
		#PlayerManager.interaction_pressed.emit()
	return null
