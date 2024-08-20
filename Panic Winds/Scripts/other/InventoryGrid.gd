extends Control

# The width and height of each item.
@export var item_size = 640
# Our mock inventory has 20 items out of a possible 100.
@export var item_count = 22
@export var column_count = 4: get = get_column_count, set = set_column_count
const max_slots = 100

# Notes:
#
# - Set rect_min_size on the child of a ScrollContainer to affect its size.
#   When either the width or height (or both) are bigger than that of
#   the ScrollContainer itself, that dimension will get a scroll bar.
# - We disable horizontal scrolling via the editor since we don't need it.
#   In doing so, we also avoid this bug: https://github.com/godotengine/godot/issues/28464
#   Set horizontal_scroll_enabled if doing it through code.
# - In the editor, under Size Flags, we check the "Expand" checkbox
#   in the "Horizontal" section. This makes the grid take up all of the available
#   space within the ScrollContainer.
# - The natural width (rect_min_size.x) of the grid is column_count * item_size.

func _ready():
	pass

func _enter_tree():
	pass
func  _process(delta):
	resize_grid()
	update_slots()
func scroll_bar_width():
	return get_parent_control().get_v_scroll_bar().size.x

func get_column_count():
	return column_count
	
func set_column_count(count):
	column_count = count
	resize_grid()
	update_slots()


func get_row_count():
	# Make sure we cast the result to an int, otherwise we have extra, unused vertical space
	# at the bottom of the grid.
	return int(max_slots / get_column_count())

func resize_grid():
	custom_minimum_size.x = get_column_count() * item_size
	custom_minimum_size.y = get_row_count() * item_size

func index_to_pos(index):
	var columns = get_column_count()
	return Vector2(int(index % columns), int(index / columns))
	
func update_slots():
	var rows = get_row_count()
	var columns = get_column_count()
	
	for slot_index in range(0, max_slots):
		if get_child_count() - 1 < slot_index:
			# No slot here yet; need to create it.
			var grid_item = preload("res://Scenes/InventoryGridSlot.tscn").instantiate()
			grid_item.position = index_to_pos(slot_index) * item_size
			grid_item.slotId = slot_index
			add_child(grid_item)
			
		var grid_item = get_child(slot_index)
		if (item_count > slot_index):
			# This slot is occupied.
				grid_item.texture = load("res://Assets/Inventory/"+str(slot_index)+".png")
		else:
			grid_item.texture = load("res://Assets/Sprites/Other/InventoryStot.png")
