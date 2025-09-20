extends PlayerState


@export var hit_box_component : HitBoxComponent

@export var _animation_name := "stun"
@export var _knockback_speed : float = 30.0
@export var _stun_deceleration : float = 2.0
@export var _invulnerable_duration : float = 1.2


var _animation_finished : bool
var _direction : Vector2
var hurt_box_component : HurtBoxComponent


@onready var idle : PlayerState = $"../Idle"



func init():
	hit_box_component.hit_box_damaged.connect(_on_player_damaged)


func enter() -> void:
	_direction = player.global_position.direction_to(hurt_box_component.global_position)
	player.velocity = _direction * -_knockback_speed
	player.set_card_direction()
	
	player.update_animation(_animation_name)
	player.animationPlayer.animation_finished.connect(_on_animation_finished)
	_animation_finished = false
	
	player.effect_animation_player.play("damaged")
	hit_box_component.set_invulnerable(_invulnerable_duration)


func exit() -> void:
	player.animationPlayer.animation_finished.disconnect(_on_animation_finished)


func process(_delta: float) -> PlayerState:
	player.velocity -= player.velocity * _stun_deceleration * _delta
	if _animation_finished:
		return idle
	return null


func _on_player_damaged(_hurt_box_component : HurtBoxComponent) -> void:
	hurt_box_component = _hurt_box_component
	player_state_machine.change_state(self)


func _on_animation_finished(_f : String) -> void:
	_animation_finished = true
