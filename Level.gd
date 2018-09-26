extends Node

var collectable = preload("res://Collectable.tscn")
var score_screen = preload("res://ScoreScreen.tscn")

export (Color) var LevelColour

var valueIncrement = true
var colour_change = false
var colour_change_speed = 0.05


func _ready():
    randomize()
    LevelColour = globals.LevelColour
    $LevelBackground.color = LevelColour
    set_process(false)
    $ColourShowTimer.start()
    globals.LevelScore = 0

func _process(delta):
    if Input.is_action_just_pressed("game_main_input"):
        colour_change = true
        $MessageLabel.text = ""
        $CollectableTimer.start()
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
    if not globals.CompletedLevels.has(globals.LevelNumber):
        globals.CompletedLevels.append(globals.LevelNumber)
    globals.save_game()
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

func _on_Collectable_score():
    globals.LevelScore += 10
    $HUD/HBoxContainer/ScoreLabel.text = str(globals.LevelScore)

func create_collectable():
    $CollectablePath/CollectableSpawnLocation.set_offset(randi())
    #Todo: Need to work out exact value to use for perpendicular offset
    var perpendicular_offset = randi() % 400
    $CollectablePath/CollectableSpawnLocation.set_v_offset(perpendicular_offset)
    var collectable_instance = collectable.instance()
    add_child(collectable_instance)
    collectable_instance.connect("score", self, "_on_Collectable_score")
    collectable_instance.position = $CollectablePath/CollectableSpawnLocation.position

func _on_CollectableTimer_timeout():
    create_collectable()

