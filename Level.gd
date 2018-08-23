extends Node

export (Color) var LevelColour
var valueIncrement = true
var colour_change = false
var colour_change_speed = 0.05

func _ready():
    $LevelBackground.color = LevelColour
    $LevelColourRect.color = LevelColour
    set_process(false)
    

func _process(delta):
    if Input.is_action_just_pressed("game_main_input"):
        colour_change = true
        $MessageLabel.text = ""
    elif colour_change and Input.is_action_just_released("game_main_input"):
        colour_change = false
        level_evaluate()
        set_process(false)
    
    if colour_change:
        $LevelBackground.color.h += delta * colour_change_speed
        if $LevelBackground.color.h > 1.0:
            $LevelBackground.color.h - 1.0

func level_evaluate():
    $MessageLabel.text = "Level Finished"
    $UserChosenColourRect.color = $LevelBackground.color
    $LevelBackground.color = Color(0.5,0.5,0.5,1.0)
    $UserChosenColourRect.show()
    $LevelColourRect.show()
    

func start_level():
    $LevelBackground.show()
    $MessageLabel.show()
    $ColourShowTimer.start()


func _on_ColourShowTimer_timeout():
    $MessageLabel.text = "Finger on\nscreen to\nstart!"
    $LevelBackground.color.s = LevelColour.s
    $LevelBackground.color.v = LevelColour.v
    $LevelBackground.color.h = 0.7
    set_process(true)
