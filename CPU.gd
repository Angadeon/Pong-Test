extends KinematicBody2D

var speed = 100
var velocity = Vector2()

var ball_pos
var current_pos

var ball_height_rel = 0


var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _physics_process(delta):
	ball_pos = get_parent().get_node("Ball").global_position
	current_pos = get_position()
	
	
	#print(ball_pos.y, "  ", current_pos.y)
	print(ball_height_rel)
	if ball_pos.y > current_pos.y + 1: #if ball is lower
		if ball_height_rel == 1:#if ball was lower last time
			pass#don't change velocity
		else:#if ball was higher last time
			velocity.y = rng.randf_range(0.2,1)#change velocity
		ball_height_rel = 1
		
	elif ball_pos.y < current_pos.y - 1: #if ball is higher
		if ball_height_rel == -1:#if ball was higher last time
			pass#don't change velocity
		else:
			velocity.y = rng.randf_range(-0.2,-1)
		ball_height_rel = -1
	else: #if ball is same height
		velocity.y = 0
		ball_height_rel = 0
		
	
	move_and_collide(velocity * speed * delta)
	#velocity.y = 0
#velocity = rng.randf_range(-0.2,-1)
