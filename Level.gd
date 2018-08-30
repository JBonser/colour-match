extends Node

var score_screen = preload("res://ScoreScreen.tscn")

export (Color) var LevelColour
var valueIncrement = true
var colour_change = false
var colour_change_speed = 0.05

func _ready():
    $LevelBackground.color = LevelColour
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
    var score_screen_instance = score_screen.instance()
    score_screen_instance.level_colour = LevelColour
    score_screen_instance.user_chosen_colour = $LevelBackground.color
    #score_screen_instance.set_colour_properties(LevelColour, $LevelBackground.color)
    add_child(score_screen_instance)

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
