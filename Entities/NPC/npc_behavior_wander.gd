@tool
class_name NPCWanderBehavior extends NPCBehavior

enum States {idle,wander}

const DIRECTIONS = [Vector2.UP,Vector2.DOWN,Vector2.LEFT,Vector2.RIGHT]

var current_state : States

@export var wander_range : float = 5.0 : set = _set_wander_range
@export var wander_speed : float = 20.0
@export var wander_duration : float = 4.0
@export var idle_min_duration : float = 4.0
@export var idle_max_duration : float = 8.0
@export var interaction_state := States.idle
#suca(Ranno).py

@onready var timer: Timer = $Timer


func _ready() -> void:
	if Engine.is_editor_hint():
		return
	super()
	timer.timeout.connect(_on_timer_timeout)
	$CollisionShape2D.queue_free()
	process_mode = Node.PROCESS_MODE_DISABLED
	
	

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if abs(npc.original_position.distance_to(npc.global_position)) >= wander_range * 32 or npc.collision_info:
		npc.direction *= -1
		npc.velocity *= -1
		npc.update_direction()
		npc.update_animation(_stringfy_state(current_state))
		
	if current_state == States.idle:
		npc.velocity = Vector2.ZERO
		
	elif current_state == States.wander:
		npc.velocity = wander_speed * npc.direction
		

func _set_wander_range(_new_range : float) -> void:
	wander_range = _new_range
	if has_node("CollisionShape2D"):
		$CollisionShape2D.shape.radius = wander_range * 32


func enable_behavior() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	
	current_state = States.idle
	timer.wait_time = randf_range(idle_min_duration,idle_max_duration)
	timer.start()

	
func disable_behavior() -> void:
	npc.velocity = Vector2.ZERO
	npc.direction = npc.global_position.direction_to(PlayerManager.player.global_position)
	npc.update_direction()
	npc.update_animation(_stringfy_state(interaction_state))
	process_mode = Node.PROCESS_MODE_DISABLED


func _on_timer_timeout() -> void:
	switch_states()

func switch_states() -> void:		#SISTEMARE IN FUTURO
	if current_state == States.idle:
		current_state = States.wander
		npc.direction = DIRECTIONS.pick_random()
		timer.wait_time = wander_duration
		
	else:
		current_state = States.idle
		timer.wait_time = randf_range(idle_min_duration,idle_max_duration)
	
	npc.update_direction()
	npc.update_animation(_stringfy_state(current_state))
	timer.start()


func _stringfy_state(_state : States) -> String:
	match _state:
		States.idle:
			return "idle"
		States.wander:
			return "wander"
	return ""
