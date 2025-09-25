@tool
class_name NPCWanderBehavior extends NPCBehavior

enum States {idle,wander}

const DIRECTIONS = [Vector2.UP,Vector2.DOWN,Vector2.LEFT,Vector2.RIGHT]

var current_state := States.idle

@export var wander_range : float = 5.0 : set = _set_wander_range
@export var wander_speed : float = 20.0
@export var wander_duration : float = 4.0
@export var idle_min_duration : float = 4.0
@export var idle_max_duration : float = 8.0
#suca(Ranno).py



func _ready() -> void:
	if Engine.is_editor_hint():
		return
	super()
	$CollisionShape2D.queue_free()
	
	

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if abs(npc.original_position.distance_to(npc.global_position)) >= wander_range * 32 or npc.collision_info:
		npc.direction *= -1
		npc.velocity *= -1
		npc.update_direction()
		npc.update_animation(_stringfy_state(current_state))
		

func _set_wander_range(_new_range : float) -> void:
	wander_range = _new_range
	if has_node("CollisionShape2D"):
		$CollisionShape2D.shape.radius = wander_range * 32


func start() -> void:
	while npc.is_behavior_enabled:

		current_state = States.idle
		
		npc.velocity = Vector2.ZERO
		npc.update_animation(_stringfy_state(current_state))
		
		await get_tree().create_timer(randf_range(idle_min_duration,idle_max_duration)).timeout
		
		current_state = States.wander
		npc.direction = DIRECTIONS.pick_random()
		npc.velocity = wander_speed * npc.direction

		npc.update_direction()
		npc.update_animation(_stringfy_state(current_state))
		
		await get_tree().create_timer(wander_duration).timeout
		
		

	
func _stringfy_state(_state : States) -> String:
	match _state:
		States.idle:
			return "idle"
		States.wander:
			return "wander"
	return ""
