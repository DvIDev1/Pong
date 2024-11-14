extends CharacterBody2D

@export_range(1 , 2) var player : int 

@export var speed = 400

func get_input() :
	var input_dir
	if player == 1:
		input_dir = Input.get_axis("p1_Up" ,"p1_Down")
	if player == 2:
		input_dir = Input.get_axis("p2_Up","p2_Down" )
		
	velocity.y = input_dir * speed
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
