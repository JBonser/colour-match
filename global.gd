extends Node
var SaveGamePath = "user://savegame.save"
var LevelColour = Color(0.5,0.5,0.5,1)
var LevelNumber = 0
var Levels = { 
    "1": "53c0ae",
    "2": "6063c0",
    "3": "4ea165",
    "4": "743c2a",
    "5": "e5a7d7",
    "6": "37746d",
    "7": "5ebbae",
    "8": "dded6d",
    "9": "f8e099",
    "10": "90b394",
    "11": "f390b3",
    "12": "f9a911",
    "13": "07c02d",
    "14": "4d16e5",
    "15": "8f4c95",
    "16": "7fa4d9",
    }

var CompletedLevels = []

var LevelScore = 0

func _ready():
    load_game()

# Note: This can be called from anywhere inside the tree.  This function is path independent.
# Go through everything in the persist category and ask them to return a dict of relevant variables
func save_game():
    var save_game = File.new()
    save_game.open(SaveGamePath, File.WRITE)
    save_game.store_var(CompletedLevels)
    save_game.close()

# Note: This can be called from anywhere inside the tree. This function is path independent.
func load_game():
    var save_game = File.new()
    if not save_game.file_exists(SaveGamePath):
        return # Error! We don't have a save to load.

    # Load the file line by line and process that dictionary to restore the object it represents
    save_game.open(SaveGamePath, File.READ)
    var levels = save_game.get_var()
    if typeof(levels) == TYPE_ARRAY:
        CompletedLevels = levels

    save_game.close()

func clear_save():
    CompletedLevels.clear()
    var dir = Directory.new()
    dir.remove(SaveGamePath)