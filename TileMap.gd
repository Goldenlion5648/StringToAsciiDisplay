extends TileMap
class_name TileDisplay

const main_layer = 0
const source_id = 0
const main_atlas_coords = Vector2i(0,0)
enum Alts{
	WHITE=0,
	BLUE=1
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func bin(n):
	var ret_str = ""
	while n > 0:
		ret_str = str(n&1) + ret_str
		n = n>>1
	return ret_str

func clear_cells():
	for cell in get_used_cells(main_layer):
		set_spot_as_white(cell.x, cell.y)

func set_spot_as_blue(x_pos, y_pos):
	self.set_cell(main_layer, Vector2i(x_pos, y_pos), source_id, main_atlas_coords, Alts.BLUE)

func set_spot_as_white(x_pos, y_pos):
	self.set_cell(main_layer, Vector2i(x_pos, y_pos), source_id, main_atlas_coords, Alts.WHITE)

func update_from_string(key: String, offset: int):
	clear_cells()
	var space = ' '
	var x_pos = 0
	var max_len = 18
	key = key.rpad(max_len, ' ')
	key = key.substr(0, max_len)
	for letter in key:
		var y_pos = 0
		var letter_with_offset = letter.unicode_at(0) - offset
		var as_binary = bin(letter_with_offset).lpad(7, '0')
		if letter_with_offset < 0:
			as_binary = '0'.repeat(7)
		#prints("binary version of ", letter, as_binary)
		if letter == space:
			x_pos += 1
			continue
			
		for digit in as_binary:
			#print(digit)
			if digit == '1':
				set_spot_as_blue(x_pos, y_pos)
			else:
				set_spot_as_white(x_pos, y_pos)
			y_pos += 1
		x_pos += 1
				
			
		
	
