extends ColorRect

export(float) var speed = 0.04

func _ready():
	randomize()
	self.color.h = rand_range(0,1)

func _process(delta):
    self.color.h += delta * speed
    if self.color.h > 1.0:
        self.color.h - 1.0
