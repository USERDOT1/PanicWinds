extends Control
var menuOpen = false
var enabled = false
var placementRotation: float
var placementType: int
var lolposition

func _ready():
		$MultiplayerSynchronizer.set_multiplayer_authority(str(GlobalVars.currentPlayer.name).to_int())
func _enter_tree():
	name = "buildingUi"
	
func _process(_delta):
	lolposition = get_global_mouse_position()
	lolposition -= GlobalVars.currentPlayer.global_position
	$DeleteSprite.position = lolposition
	if GlobalVars.erasingBlock:
		$DeleteSprite.visible = true
	else:
		$DeleteSprite.visible = false
	if $MultiplayerSynchronizer.get_multiplayer_authority() == multiplayer.get_unique_id():
		self.scale = Vector2(1/(GlobalVars.currentCamera.zoom.x*10),1/(GlobalVars.currentCamera.zoom.y*10))
		GlobalVars.currentBuildingUi = self
		rotation = deg_to_rad(90)
		position = Vector2(0,0)
		if (GlobalVars.buildingEnabled && enabled == false):
			$ScrollContainer/InventoryGrid.update_slots()
			$ScrollContainer/InventoryGrid.reset_size()
		if(GlobalVars.buildingEnabled && GlobalVars.inStation):
			self.show()
			enabled = true
		else:
			self.hide()
			enabled = false
 


func _on_button_pressed():
	GlobalVars.blockSelected = false
	GlobalVars.erasingBlock = true
