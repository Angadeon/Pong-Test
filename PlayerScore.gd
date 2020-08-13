extends Label

var score = 0

func _ready():
	set_text(String(score))

func _on_CPU_Goal2_body_entered(body):
	if (body.get_name() == "Ball"):
		score += 1
		set_text(String(score))
