extends Node
var SaveGamePath = "user://savegame.save"
var LevelColour = Color(0.5,0.5,0.5,1)
var LevelNumber = 0
var LevelStar1Score = 0
var LevelStar2Score = 0
var LevelStar3Score = 0
var Levels = { 
    "1": { "colour" : "53c0ae", "star_requirement" : "0"},
    "2": { "colour" : "6063c0", "star_requirement" : "0"},
    "3": { "colour" : "4ea165", "star_requirement" : "0"},
    "4": { "colour" : "743c2a", "star_requirement" : "7"},
    "5": { "colour" : "e5a7d7", "star_requirement" : "9"},
    "6": { "colour" : "37746d", "star_requirement" : "12"},
    "7": { "colour" : "5ebbae", "star_requirement" : "14"},
    "8": { "colour" : "dded6d", "star_requirement" : "17"},
    "9": { "colour" : "f8e099", "star_requirement" : "20"},
    "10": { "colour" : "90b394", "star_requirement" : "23"},
    "11": { "colour" : "f390b3", "star_requirement" : "27"},
    "12": { "colour" : "f9a911", "star_requirement" : "30"},
    "13": { "colour" : "07c02d", "star_requirement" : "34"},
    "14": { "colour" : "4d16e5", "star_requirement" : "37"},
    "15": { "colour" : "8f4c95", "star_requirement" : "41"},
    "16": { "colour" : "7fa4d9", "star_requirement" : "44"},
    }

var SaveData = {
    "completed_levels": {},
}

var LevelScore = 0

func _ready():
    load_game()

func calculate_total_stars():
    var num_stars = 0
    for i in SaveData["completed_levels"]:
        var level = SaveData["completed_levels"][i]
        num_stars += int(level["stars"])
    return num_stars

func save_game():
    var save_game = File.new()
    save_game.open(SaveGamePath, File.WRITE)
    save_game.store_var(SaveData)
    save_game.close()

func load_game():
    var save_game = File.new()
    if not save_game.file_exists(SaveGamePath):
        return # Error! We don't have a save to load.

    # Load the file line by line and process that dictionary to restore the object it represents
    save_game.open(SaveGamePath, File.READ)
    var save_data = save_game.get_var()
    if typeof(save_data) == TYPE_DICTIONARY:
        SaveData = save_data

    save_game.close()

func clear_save():
    SaveData["completed_levels"].clear()
    SaveData["stars"] = 0
    var dir = Directory.new()
    dir.remove(SaveGamePath)