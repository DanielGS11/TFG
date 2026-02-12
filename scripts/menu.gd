extends Control

@onready var enemies_number_label := $Layout/Menu_Elements/Elements/Enemies_Number_Selector/Field_Background/MarginContainer/Enemies_Number

@onready var player_name := $Layout/Menu_Elements/Elements/Player_Name_Field

@onready var classes := $Layout/Menu_Elements/Elements/Player_Class.get_children()

var player_class := ""

var enemies_number := 1

func _ready():
	print(classes)

func _on_play_pressed():
	reset();

func _on_minus_pressed():
	if enemies_number != 1:
		enemies_number -= 1
		enemies_number_label.text = str(enemies_number)

func _on_plus_pressed() -> void:
	enemies_number += 1
	enemies_number_label.text = str(enemies_number)

func _on_class_selected(button: Button):
	for b in classes:
		if b != button:
			b.pressed = false
	
	player_class = button.name

func reset():
	enemies_number = 1
	enemies_number_label.text = str(enemies_number)
	player_name.text = ""
	player_class = ""
