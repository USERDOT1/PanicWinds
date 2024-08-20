extends Popup
var gamePausedHere = false

# Video Settings
@onready var display_options = $SettingTabs/Video/MarginContainer/VideoSettings/DisplayOptions
@onready var vsync_btn = $SettingTabs/Video/MarginContainer/VideoSettings/VsyncBtn
@onready var display_fps_btn = $SettingTabs/Video/MarginContainer/VideoSettings/DisplayFpsBtn
@onready var max_fps_val = $SettingTabs/Video/MarginContainer/VideoSettings/MaxFpsOption/MaxFpsVal
@onready var max_fps_slider = $SettingTabs/Video/MarginContainer/VideoSettings/MaxFpsOption/MaxFpsSlider
@onready var bloom_btn = $SettingTabs/Video/MarginContainer/VideoSettings/BloomBtn
@onready var brightness_slider = $SettingTabs/Video/MarginContainer/VideoSettings/BrightnessSlider

# Audio Settings
@onready var master_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/MasterSlider
@onready var music_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/MusicSlider
@onready var sfx_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/SfxSlider

# Gameplay Settings
@onready var fov_amount = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/FovOption/FovAmount
@onready var fov_slider = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/FovOption/FovSlider
@onready var mouse_sens_amount = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/MouseSensOption/MouseSensAmount
@onready var mouse_slider = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/MouseSensOption/MouseSlider


func _ready():
	if get_parent().get_parent() == GlobalVars.currentPlayer:
		GlobalVars.currentPauseMenu = self
	$SettingTabs/Audio/MarginContainer2/AudioSettings/MasterSlider.value = GlobalVars.masterVolumeSave
	AudioServer.set_bus_volume_db(0, GlobalVars.masterVolumeSave + 10)
	$SettingTabs/Audio/MarginContainer2/AudioSettings/MusicSlider.value = GlobalVars.musicVolumeSave
	AudioServer.set_bus_volume_db(1, GlobalVars.musicVolumeSave + 3)
	$SettingTabs/Audio/MarginContainer2/AudioSettings/SfxSlider.value = GlobalVars.sfxVolumeSaved
	AudioServer.set_bus_volume_db(3, GlobalVars.sfxVolumeSaved + 10)
	$SettingTabs/Audio/MarginContainer2/AudioSettings/ShipVoiceSlider.value = GlobalVars.shipVoiceVolumeSaved
	AudioServer.set_bus_volume_db(2, GlobalVars.shipVoiceVolumeSaved + 10)
	
	$SettingTabs/Input/MarginContainer/VideoSettings/InputOneOptions.selected = GlobalVars.defaultOneBind
	$SettingTabs/Input/MarginContainer/VideoSettings/InputTwoOptions.selected = GlobalVars.defaultTwoBind
	$SettingTabs/Input/MarginContainer/VideoSettings/InputThreeOptions.selected = GlobalVars.defaultThreeBind
	$SettingTabs/Input/MarginContainer/VideoSettings/InputFourOptions.selected = GlobalVars.defaultFourBind
	$SettingTabs/Input/MarginContainer/VideoSettings/InputFiveOptions.selected = GlobalVars.defaultFiveBind
	$SettingTabs/Input/MarginContainer/VideoSettings/InputSixOptions.selected = GlobalVars.defaultSixBind
	$SettingTabs/Input/MarginContainer/VideoSettings/InputSevenOptions.selected = GlobalVars.defaultSevenBind
	$SettingTabs/Input/MarginContainer/VideoSettings/InputEightOptions.selected = GlobalVars.defaultEightBind
	$SettingTabs/Input/MarginContainer/VideoSettings/InputNineOptions.selected = GlobalVars.defaultNineBind
func _process(delta):
	if get_parent() == GlobalVars.currentCamera:
		GlobalVars.InputOne = $SettingTabs/Input/MarginContainer/VideoSettings/InputOneOptions.get_selected_id()
		GlobalVars.InputTwo = $SettingTabs/Input/MarginContainer/VideoSettings/InputTwoOptions.get_selected_id()
		GlobalVars.InputThree = $SettingTabs/Input/MarginContainer/VideoSettings/InputThreeOptions.get_selected_id()
		GlobalVars.InputFour = $SettingTabs/Input/MarginContainer/VideoSettings/InputFourOptions.get_selected_id()
		GlobalVars.InputFive = $SettingTabs/Input/MarginContainer/VideoSettings/InputFiveOptions.get_selected_id()
		GlobalVars.InputSix = $SettingTabs/Input/MarginContainer/VideoSettings/InputSixOptions.get_selected_id()
		GlobalVars.InputSeven = $SettingTabs/Input/MarginContainer/VideoSettings/InputSevenOptions.get_selected_id()
		GlobalVars.InputEight = $SettingTabs/Input/MarginContainer/VideoSettings/InputEightOptions.get_selected_id()
		GlobalVars.InputNine = $SettingTabs/Input/MarginContainer/VideoSettings/InputNineOptions.get_selected_id()
		if GlobalVars.InputOne == 0:
			GlobalVars.oneBind = "OnePressed"
		if GlobalVars.InputOne == 1:
			GlobalVars.oneBind = "TwoPressed"
		if GlobalVars.InputOne == 2:
			GlobalVars.oneBind = "ThreePressed"
		if GlobalVars.InputOne == 3:
			GlobalVars.oneBind = "FourPressed"
		if GlobalVars.InputOne == 4:
			GlobalVars.oneBind = "FivePressed"
		if GlobalVars.InputOne == 5:
			GlobalVars.oneBind = "SixPressed"
		if GlobalVars.InputOne == 6:
			GlobalVars.oneBind = "SevenPressed"
		if GlobalVars.InputOne == 7:
			GlobalVars.oneBind = "EightPressed"
		if GlobalVars.InputOne == 8:
			GlobalVars.oneBind = "NinePressed"
		if GlobalVars.InputOne == 9:
			GlobalVars.oneBind = "LeftClick"
		if GlobalVars.InputOne == 10:
			GlobalVars.oneBind = "RightClick"
		if GlobalVars.InputOne == 11:
			GlobalVars.oneBind = "MiddleClick"
		if GlobalVars.InputOne == 12:
			GlobalVars.oneBind = "SpacePressed"
		if GlobalVars.InputOne == 13:
			GlobalVars.oneBind = "ScrollDown"
		
		if GlobalVars.InputTwo == 0:
			GlobalVars.twoBind = "OnePressed"
		if GlobalVars.InputTwo == 1:
			GlobalVars.twoBind = "TwoPressed"
		if GlobalVars.InputTwo == 2:
			GlobalVars.twoBind = "ThreePressed"
		if GlobalVars.InputTwo == 3:
			GlobalVars.twoBind = "FourPressed"
		if GlobalVars.InputTwo == 4:
			GlobalVars.twoBind = "FivePressed"
		if GlobalVars.InputTwo == 5:
			GlobalVars.twoBind = "SixPressed"
		if GlobalVars.InputTwo == 6:
			GlobalVars.twoBind = "SevenPressed"
		if GlobalVars.InputTwo == 7:
			GlobalVars.twoBind = "EightPressed"
		if GlobalVars.InputTwo == 8:
			GlobalVars.twoBind = "NinePressed"
		if GlobalVars.InputTwo == 9:
			GlobalVars.twoBind = "LeftClick"
		if GlobalVars.InputTwo == 10:
			GlobalVars.twoBind = "RightClick"
		if GlobalVars.InputTwo == 11:
			GlobalVars.twoBind = "MiddleClick"
		if GlobalVars.InputTwo == 12:
			GlobalVars.twoBind = "SpacePressed"
		if GlobalVars.InputTwo == 13:
			GlobalVars.twoBind = "ScrollDown"
		
		if GlobalVars.InputThree == 0:
			GlobalVars.threeBind = "OnePressed"
		if GlobalVars.InputThree == 1:
			GlobalVars.threeBind = "TwoPressed"
		if GlobalVars.InputThree == 2:
			GlobalVars.threeBind = "ThreePressed"
		if GlobalVars.InputThree == 3:
			GlobalVars.threeBind = "FourPressed"
		if GlobalVars.InputThree == 4:
			GlobalVars.threeBind = "FivePressed"
		if GlobalVars.InputThree == 5:
			GlobalVars.threeBind = "SixPressed"
		if GlobalVars.InputThree == 6:
			GlobalVars.threeBind = "SevenPressed"
		if GlobalVars.InputThree == 7:
			GlobalVars.threeBind = "EightPressed"
		if GlobalVars.InputThree == 8:
			GlobalVars.threeBind = "NinePressed"
		if GlobalVars.InputThree == 9:
			GlobalVars.threeBind = "LeftClick"
		if GlobalVars.InputThree == 10:
			GlobalVars.threeBind = "RightClick"
		if GlobalVars.InputThree == 11:
			GlobalVars.threeBind = "MiddleClick"
		if GlobalVars.InputThree == 12:
			GlobalVars.threeBind = "SpacePressed"
		if GlobalVars.InputThree == 13:
			GlobalVars.threeBind = "ScrollDown"
		
		if GlobalVars.InputFour == 0:
			GlobalVars.fourBind = "OnePressed"
		if GlobalVars.InputFour == 1:
			GlobalVars.fourBind = "TwoPressed"
		if GlobalVars.InputFour == 2:
			GlobalVars.fourBind = "ThreePressed"
		if GlobalVars.InputFour == 3:
			GlobalVars.fourBind = "FourPressed"
		if GlobalVars.InputFour == 4:
			GlobalVars.fourBind = "FivePressed"
		if GlobalVars.InputFour == 5:
			GlobalVars.fourBind = "SixPressed"
		if GlobalVars.InputFour == 6:
			GlobalVars.fourBind = "SevenPressed"
		if GlobalVars.InputFour == 7:
			GlobalVars.fourBind = "EightPressed"
		if GlobalVars.InputFour == 8:
			GlobalVars.fourBind = "NinePressed"
		if GlobalVars.InputFour == 9:
			GlobalVars.fourBind = "LeftClick"
		if GlobalVars.InputFour == 10:
			GlobalVars.fourBind = "RightClick"
		if GlobalVars.InputFour == 11:
			GlobalVars.fourBind = "MiddleClick"
		if GlobalVars.InputFour == 12:
			GlobalVars.fourBind = "SpacePressed"
		if GlobalVars.InputFour == 13:
			GlobalVars.fourBind = "ScrollDown"
			
		if GlobalVars.InputFive == 0:
			GlobalVars.fiveBind = "OnePressed"
		if GlobalVars.InputFive == 1:
			GlobalVars.fiveBind = "TwoPressed"
		if GlobalVars.InputFive == 2:
			GlobalVars.fiveBind = "ThreePressed"
		if GlobalVars.InputFive == 3:
			GlobalVars.fiveBind = "FourPressed"
		if GlobalVars.InputFive == 4:
			GlobalVars.fiveBind = "FivePressed"
		if GlobalVars.InputFive == 5:
			GlobalVars.fiveBind = "SixPressed"
		if GlobalVars.InputFive == 6:
			GlobalVars.fiveBind = "SevenPressed"
		if GlobalVars.InputFive == 7:
			GlobalVars.fiveBind = "EightPressed"
		if GlobalVars.InputFive == 8:
			GlobalVars.fiveBind = "NinePressed"
		if GlobalVars.InputFive == 9:
			GlobalVars.fiveBind = "LeftClick"
		if GlobalVars.InputFive == 10:
			GlobalVars.fiveBind = "RightClick"
		if GlobalVars.InputFive == 11:
			GlobalVars.fiveBind = "MiddleClick"
		if GlobalVars.InputFive == 12:
			GlobalVars.fiveBind = "SpacePressed"
		if GlobalVars.InputFive == 13:
			GlobalVars.fiveBind = "ScrollDown"
			
		if GlobalVars.InputSix == 0:
			GlobalVars.sixBind = "OnePressed"
		if GlobalVars.InputSix == 1:
			GlobalVars.sixBind = "TwoPressed"
		if GlobalVars.InputSix == 2:
			GlobalVars.sixBind = "ThreePressed"
		if GlobalVars.InputSix == 3:
			GlobalVars.sixBind = "FourPressed"
		if GlobalVars.InputSix == 4:
			GlobalVars.sixBind = "FivePressed"
		if GlobalVars.InputSix == 5:
			GlobalVars.sixBind = "SixPressed"
		if GlobalVars.InputSix == 6:
			GlobalVars.sixBind = "SevenPressed"
		if GlobalVars.InputSix == 7:
			GlobalVars.sixBind = "EightPressed"
		if GlobalVars.InputSix == 8:
			GlobalVars.sixBind = "NinePressed"
		if GlobalVars.InputSix == 9:
			GlobalVars.sixBind = "LeftClick"
		if GlobalVars.InputSix == 10:
			GlobalVars.sixBind = "RightClick"
		if GlobalVars.InputSix == 11:
			GlobalVars.sixBind = "MiddleClick"
		if GlobalVars.InputSix == 12:
			GlobalVars.sixBind = "SpacePressed"
		if GlobalVars.InputSix == 13:
			GlobalVars.sixBind = "ScrollDown"
			
		if GlobalVars.InputSeven == 0:
			GlobalVars.sevenBind = "OnePressed"
		if GlobalVars.InputSeven == 1:
			GlobalVars.sevenBind = "TwoPressed"
		if GlobalVars.InputSeven == 2:
			GlobalVars.sevenBind = "ThreePressed"
		if GlobalVars.InputSeven == 3:
			GlobalVars.sevenBind = "FourPressed"
		if GlobalVars.InputSeven == 4:
			GlobalVars.sevenBind = "FivePressed"
		if GlobalVars.InputSeven == 5:
			GlobalVars.sevenBind = "SixPressed"
		if GlobalVars.InputSeven == 6:
			GlobalVars.sevenBind = "SevenPressed"
		if GlobalVars.InputSeven == 7:
			GlobalVars.sevenBind = "EightPressed"
		if GlobalVars.InputSeven == 8:
			GlobalVars.sevenBind = "NinePressed"
		if GlobalVars.InputSeven == 9:
			GlobalVars.sevenBind = "LeftClick"
		if GlobalVars.InputSeven == 10:
			GlobalVars.sevenBind = "RightClick"
		if GlobalVars.InputSeven == 11:
			GlobalVars.sevenBind = "MiddleClick"
		if GlobalVars.InputSeven == 12:
			GlobalVars.sevenBind = "SpacePressed"
		if GlobalVars.InputSeven == 13:
			GlobalVars.sevenBind = "ScrollDown"
			
		if GlobalVars.InputEight == 0:
			GlobalVars.eightBind = "OnePressed"
		if GlobalVars.InputEight == 1:
			GlobalVars.eightBind = "TwoPressed"
		if GlobalVars.InputEight == 2:
			GlobalVars.eightBind = "ThreePressed"
		if GlobalVars.InputEight == 3:
			GlobalVars.eightBind = "FourPressed"
		if GlobalVars.InputEight == 4:
			GlobalVars.eightBind = "FivePressed"
		if GlobalVars.InputEight == 5:
			GlobalVars.eightBind = "SixPressed"
		if GlobalVars.InputEight == 6:
			GlobalVars.eightBind = "SevenPressed"
		if GlobalVars.InputEight == 7:
			GlobalVars.eightBind = "EightPressed"
		if GlobalVars.InputEight == 8:
			GlobalVars.eightBind = "NinePressed"
		if GlobalVars.InputEight == 9:
			GlobalVars.eightBind = "LeftClick"
		if GlobalVars.InputEight == 10:
			GlobalVars.eightBind = "RightClick"
		if GlobalVars.InputEight == 11:
			GlobalVars.eightBind = "MiddleClick"
		if GlobalVars.InputEight == 12:
			GlobalVars.eightBind = "SpacePressed"
		if GlobalVars.InputEight == 13:
			GlobalVars.eightBind = "ScrollDown"
			
		if GlobalVars.InputNine == 0:
			GlobalVars.nineBind = "OnePressed"
		if GlobalVars.InputNine == 1:
			GlobalVars.nineBind = "TwoPressed"
		if GlobalVars.InputNine == 2:
			GlobalVars.nineBind = "ThreePressed"
		if GlobalVars.InputNine == 3:
			GlobalVars.nineBind = "FourPressed"
		if GlobalVars.InputNine == 4:
			GlobalVars.nineBind = "FivePressed"
		if GlobalVars.InputNine == 5:
			GlobalVars.nineBind = "SixPressed"
		if GlobalVars.InputNine == 6:
			GlobalVars.nineBind = "SevenPressed"
		if GlobalVars.InputNine == 7:
			GlobalVars.nineBind = "EightPressed"
		if GlobalVars.InputNine == 8:
			GlobalVars.nineBind = "NinePressed"
		if GlobalVars.InputNine == 9:
			GlobalVars.nineBind = "LeftClick"
		if GlobalVars.InputNine == 10:
			GlobalVars.nineBind = "RightClick"
		if GlobalVars.InputNine == 11:
			GlobalVars.nineBind = "MiddleClick"
		if GlobalVars.InputNine == 12:
			GlobalVars.nineBind = "SpacePressed"
		if GlobalVars.InputNine == 13:
			GlobalVars.nineBind = "ScrollDown"
		


func _on_music_slider_value_changed(value):
	#Sfx 
	if get_parent() == GlobalVars.currentCamera:
		AudioServer.set_bus_volume_db(2, value + 3)


func _on_sfx_slider_value_changed(value):
	if get_parent() == GlobalVars.currentCamera:
		AudioServer.set_bus_volume_db(1, value + 10)


func _on_ship_voice_slider_value_changed(value):
	if get_parent() == GlobalVars.currentCamera:
		AudioServer.set_bus_volume_db(3, value + 10)


func _on_master_slider_value_changed(value):
	# Master
	if get_parent() == GlobalVars.currentCamera:
		AudioServer.set_bus_volume_db(0, value + 10)
