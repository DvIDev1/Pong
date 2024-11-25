extends CharacterBody2D

@export var speed = 400
@onready var ball = $"../../Ball"
	

func _physics_process(delta: float) -> void: 
	velocity.y = position.direction_to(ball.position + ball.velocity).y * speed
	move_and_slide()
