class_name FSM
extends Node

@export var state: State
@export var actor: Node2D
@export var anim: AnimationPlayer

func _ready():	
	for child in get_children():
		assert(child is State, "Child is not a State")
		
		child.actor = actor
		child.anim = anim
		child.fsm = self
	
	assert(state is State, "Starting state is not set or not a state")
	state._enter_state()

func _physics_process(delta):
	state._run(delta)

func get_current_state():
	return state.name

func change_state(new_state: State):
	assert(new_state is State, "You are attempting to change to a non-State based state")
	state._exit_state()
	new_state._enter_state()
	state = new_state
