extends Label

var score = 0

func _ready():
	set_text(String(score))

func _on_Player_Goal_body_entered(body):
	if (body.get_name() == "Ball"):
		score += 1
		set_text(String(score))
