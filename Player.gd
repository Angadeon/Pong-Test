extends KinematicBody2D

var speed = 100
var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
		
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	
	
	move_and_collide(velocity * speed * delta)
	velocity.y = 0
