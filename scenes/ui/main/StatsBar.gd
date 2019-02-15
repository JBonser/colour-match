extends MarginContainer

func _ready():
    calculate_stats()

func calculate_stats():
    $VBoxContainer/StarValue.text = str(globals.calculate_total_stars())
    
    