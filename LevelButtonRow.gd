extends HBoxContainer

export var num_levels = 4
export var starting_level_number = 1

var level_button = preload("res://LevelButton.tscn")

func _ready():
    for i in range(0, num_levels):
        var btn_instance = level_button.instance()
        btn_instance.text = str(i+starting_level_number)
        #btn_instance.LevelColour = Color("ef5c5c")
        btn_instance.LevelColour = Color("53c0ae")
        add_child(btn_instance)