extends RigidBody2D

var speed = 100
var direction = Vector2()

var origin = Vector2(80,60)
var reset = true

var rng = RandomNumberGenerator.new()

signal resetting
signal startting

#var state = Physics2DDirectBodyState.new()

func _ready():
	rng.randomize()

func do_reset(state):
	
	state.transform = Transform2D(0.0, Vector2(80, 60))
	state.set_linear_velocity(Vector2())
	
	if Input.is_action_pressed("ui_select"):
		emit_signal("startting")
		
		direction.x = (randi() & 2) - 1
		direction.y = rng.randf_range (-1, 1)
		
		direction = direction.normalized()
		apply_central_impulse(direction * speed)
		
	#	set_global_pos(Vector2(0,0))
		reset = false
	
func _integrate_forces(state):
	if reset:
		do_reset(state)

#func _physics_process(delta):
#	pass

#func _process(delta):
#	pass


#func _on_CPU_Goal2_body_entered(body):
#	print("hello")
#
#	reset = true
#
#func _on_Player_Goal_body_entered(body):
#	print("hello")
#	reset = true


func _on_Player_Goal_body_entered(body):
	reset = true
	emit_signal("resetting")


func _on_CPU_Goal2_body_entered(body):
	reset = true
	emit_signal("resetting")
