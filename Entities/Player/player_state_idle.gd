extends PlayerState


@export var _animation_name := "idle" 


@onready var walk : PlayerState = $"../Walk"
@onready var attack : PlayerState = $"../Attack"


func enter() -> void:
	player.update_animation(_animation_name)


func process(_delta: float) -> PlayerState:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null


func handle_input(_event : InputEvent) -> PlayerState:
	if(_event.is_action_pressed("key_attack")):
		return attack
	#if(_event.is_action_pressed("key_interact")):
		#PlayerManager.interaction_pressed.emit()
	return null
