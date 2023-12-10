extends Node2D


var word_mask = ''
var amount_to_sub = 0


func update_display():
	var display: TileDisplay = get_node("TileMap")
	display.update_from_string(word_mask, amount_to_sub)

func _on_text_edit_text_changed():
	word_mask = get_node("text_box").text
	update_display()


func _on_h_slider_drag_ended(value_changed):
	amount_to_sub = get_node("number_slider").value
	get_node("slider_display").text = str(amount_to_sub)
	update_display()
	
