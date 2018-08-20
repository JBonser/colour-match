extends Node

export (Color) var LevelColour
var valueIncrement = true
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    $LevelBackground.color = LevelColour
    set_process(false)
    

func _process(delta):
    $LevelBackground.color.h += delta * 0.05
    if valueIncrement:
        $LevelBackground.color.v += delta * 0.05
    else:
        $LevelBackground.color.v -= delta * 0.05
    if $LevelBackground.color.h > 1.0:
        $LevelBackground.color.h - 1.0
    if $LevelBackground.color.v > 0.8 || $LevelBackground.color.v < 0.2:
        valueIncrement = !valueIncrement


func start_level():
    $LevelBackground.show()
    $LevelCanvas/MessageLabel.show()
    $ColourShowTimer.start()


func _on_ColourShowTimer_timeout():
    $LevelCanvas/MessageLabel.text = "Finger on\nscreen to\nstart!"
    $LevelBackground.color.s = LevelColour.s
    $LevelBackground.color.v = LevelColour.v
    $LevelBackground.color.h = 0.7
    set_process(true)
