extends PlayerState


@export var hurt_box_component : HurtBoxComponent
@export var _animation_name := "attack"
@export var _attack_slowness : float = 20.0
@export var _attack_sound : AudioStream


var _attacking : bool = false


@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var idle : PlayerState = $"../Idle"
@onready var walk : PlayerState = $"../Walk"
@onready var audio_stream : AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"



func enter() -> void:
	player.update_animation(_animation_name)
	animation_player.animation_finished.connect(_on_attack_ended)
		
	audio_stream.stream = _attack_sound
	audio_stream.pitch_scale=randf_range(0.8,1.1)
	audio_stream.play()
	
	_attacking=true
	
	await get_tree().create_timer(0.075).timeout
	if _attacking:
		hurt_box_component.monitoring = true
	else:
		hurt_box_component.monitoring = false
	

func exit() -> void:
	_attacking=false
	animation_player.animation_finished.disconnect(_on_attack_ended)
	hurt_box_component.monitoring = false


func process(_delta: float) -> PlayerState:
	player.velocity-= player.velocity * _attack_slowness * _delta
	if !_attacking:
		if player.direction==Vector2.ZERO:
			return idle
		else:
			return walk
	return null


func _on_attack_ended(_anim_name : StringName) -> void:
	_attacking=false
	
