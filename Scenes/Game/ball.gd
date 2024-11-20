extends CharacterBody2D

var hitSFX = preload("res://Assets/Audio/hit.wav")

@onready var ScoreOne = $"../AspectRatioContainer/Score1"

@onready var ScoreTwo = $"../AspectRatioContainer/Score2"

var rng = RandomNumberGenerator.new()
var screen_size:Vector2
@export var min_speed :int
@export var max_speed :int
@export var min_SpeedMultiplier :float
@export var max_SpeedMultiplier :float
var speed :int
var direction:Vector2 = Vector2.ZERO

func _ready() -> void:
	speed = min_speed
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * speed * delta)

	print(direction)
	
	if collision:
		SFXPlayer.playSFX(hitSFX)
		var collider : Object = collision.get_collider()
			
		if collider is StaticBody2D:
			if collider.get_collision_layer_value(3):
				ScoreTwo.text = str(int(ScoreTwo.text) + 1)
				reset_ball_and_serve()
			if collider.get_collision_layer_value(4):
				ScoreOne.text = str(int(ScoreOne.text) + 1)
				reset_ball_and_serve()
		
		if collider is CharacterBody2D:
			speed *= randf_range(min_SpeedMultiplier , max_SpeedMultiplier)
		
		
		velocity = velocity.bounce(collision.get_normal())
	
	speed = clamp(speed, min_speed , max_speed)
	

func set_random_direction():
	var zero_or_one = rng.randi_range(0, 1)
	direction = Vector2(-1 if zero_or_one == 0 else 1, rng.randf_range(-1, 1))
	velocity = direction.normalized()

func reset_ball_and_serve():
	position = Vector2(screen_size.x/2, screen_size.y/2)
	speed = min_speed
	set_random_direction()
