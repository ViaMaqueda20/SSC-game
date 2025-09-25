class_name Player extends CharacterBody2D


signal direction_changed(new_direction : Vector2)


const DIR_VEC = [Vector2.RIGHT,Vector2.DOWN,Vector2.LEFT,Vector2.UP]


var direction : Vector2
var cardinal_direction : Vector2
var invulnerable : bool = false


@export var health_component : HealthComponent
@export var hit_box_component : HitBoxComponent
@export var hurt_box_component : HurtBoxComponent


@onready var animationPlayer : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var player_state_machine : PlayerStateMachine = $PlayerStateMachine
@onready var effect_animation_player : AnimationPlayer = $EffectAnimationPlayer


func _ready() -> void:
	PlayerManager.player = self
	
	player_state_machine.initialize(self)
	#PlayerHud.update_hp(health_component.hp,health_component.max_hp)
	
	direction = Vector2.ZERO
	cardinal_direction = Vector2.DOWN
	
	#Dialogic.start("placeholder")
	#health_component.damaged.connect(_player_damaged)
	#health_component.destroyed.connect(_player_destroyed)
	#health_component.healed.connect(_player_healed)


func _process(_delta: float) -> void:
	direction = Vector2(
		Input.get_axis("key_left","key_right"),
		Input.get_axis("key_up","key_down")
	).normalized()


func _physics_process(_delta: float) -> void:
	move_and_slide()


func set_card_direction() -> bool:
	if direction == Vector2.ZERO:
		return false
	
	var new_cardinal_direction : Vector2 = DIR_VEC[int(round((direction+cardinal_direction*0.1).angle()/TAU*DIR_VEC.size()))] 

	if cardinal_direction == new_cardinal_direction:
		return false
	
	direction_changed.emit(new_cardinal_direction)
	
	sprite.scale.x = -1 if direction.x<0 else 1
	hurt_box_component.scale.x = -1 if direction.x<0 else 1
	cardinal_direction=new_cardinal_direction
	
	return true

func update_animation(state : String) -> void:
	animationPlayer.play(state + "_" + _vector_to_direction())


func _vector_to_direction() -> String:
	if cardinal_direction==Vector2.DOWN:
		return "down"
	elif cardinal_direction==Vector2.UP: 
		return "up"
	else:
		return "side"
		

#func _player_damaged() -> void:
	#PlayerHud.update_hp(health_component.hp,health_component.max_hp)
	#
#func _player_destroyed() -> void:
	#health_component.update_health(99)
	#PlayerHud.update_hp(health_component.hp,health_component.max_hp)
	#
#func _player_healed() -> void:
	#PlayerHud.update_hp(health_component.hp,health_component.max_hp)
