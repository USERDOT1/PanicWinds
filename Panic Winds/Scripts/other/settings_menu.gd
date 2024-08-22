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
		elif GlobalVars.InputOne == 1:
			GlobalVars.oneBind = "TwoPressed"
		elif GlobalVars.InputOne == 2:
			GlobalVars.oneBind = "ThreePressed"
		elif GlobalVars.InputOne == 3:
			GlobalVars.oneBind = "FourPressed"
		elif GlobalVars.InputOne == 4:
			GlobalVars.oneBind = "FivePressed"
		elif GlobalVars.InputOne == 5:
			GlobalVars.oneBind = "SixPressed"
		elif GlobalVars.InputOne == 6:
			GlobalVars.oneBind = "SevenPressed"
		elif GlobalVars.InputOne == 7:
			GlobalVars.oneBind = "EightPressed"
		elif GlobalVars.InputOne == 8:
			GlobalVars.oneBind = "NinePressed"
		elif GlobalVars.InputOne == 9:
			GlobalVars.oneBind = "LeftClick"
		elif GlobalVars.InputOne == 10:
			GlobalVars.oneBind = "RightClick"
		elif GlobalVars.InputOne == 11:
			GlobalVars.oneBind = "MiddleClick"
		elif GlobalVars.InputOne == 12:
			GlobalVars.oneBind = "SpacePressed"
		elif GlobalVars.InputOne == 13:
			GlobalVars.oneBind = "WPressed"
		elif GlobalVars.InputOne == 14:
			GlobalVars.oneBind = "APressed"
		elif GlobalVars.InputOne == 15:
			GlobalVars.oneBind = "SPressed"
		elif GlobalVars.InputOne == 16:
			GlobalVars.oneBind = "DPressed"
		elif GlobalVars.InputOne == 17:
			GlobalVars.oneBind = "QPressed"
		elif GlobalVars.InputOne == 18:
			GlobalVars.oneBind = "EPressed"
		
		if GlobalVars.InputTwo == 0:
			GlobalVars.twoBind = "OnePressed"
		elif GlobalVars.InputTwo == 1:
			GlobalVars.twoBind = "TwoPressed"
		elif GlobalVars.InputTwo == 2:
			GlobalVars.twoBind = "ThreePressed"
		elif GlobalVars.InputTwo == 3:
			GlobalVars.twoBind = "FourPressed"
		elif GlobalVars.InputTwo == 4:
			GlobalVars.twoBind = "FivePressed"
		elif GlobalVars.InputTwo == 5:
			GlobalVars.twoBind = "SixPressed"
		elif GlobalVars.InputTwo == 6:
			GlobalVars.twoBind = "SevenPressed"
		elif GlobalVars.InputTwo == 7:
			GlobalVars.twoBind = "EightPressed"
		elif GlobalVars.InputTwo == 8:
			GlobalVars.twoBind = "NinePressed"
		elif GlobalVars.InputTwo == 9:
			GlobalVars.twoBind = "LeftClick"
		elif GlobalVars.InputTwo == 10:
			GlobalVars.twoBind = "RightClick"
		elif GlobalVars.InputTwo == 11:
			GlobalVars.twoBind = "MiddleClick"
		elif GlobalVars.InputTwo == 12:
			GlobalVars.twoBind = "SpacePressed"
		elif GlobalVars.InputTwo == 13:
			GlobalVars.twoBind = "WPressed"
		elif GlobalVars.InputTwo == 14:
			GlobalVars.twoBind = "APressed"
		elif GlobalVars.InputTwo == 15:
			GlobalVars.twoBind = "SPressed"
		elif GlobalVars.InputTwo == 16:
			GlobalVars.twoBind = "DPressed"
		elif GlobalVars.InputTwo == 17:
			GlobalVars.twoBind = "QPressed"
		elif GlobalVars.InputTwo == 18:
			GlobalVars.twoBind = "EPressed"
			
		if GlobalVars.InputThree == 0:
			GlobalVars.threeBind = "OnePressed"
		elif GlobalVars.InputThree == 1:
			GlobalVars.threeBind = "TwoPressed"
		elif GlobalVars.InputThree == 2:
			GlobalVars.threeBind = "ThreePressed"
		elif GlobalVars.InputThree == 3:
			GlobalVars.threeBind = "FourPressed"
		elif GlobalVars.InputThree == 4:
			GlobalVars.threeBind = "FivePressed"
		elif GlobalVars.InputThree == 5:
			GlobalVars.threeBind = "SixPressed"
		elif GlobalVars.InputThree == 6:
			GlobalVars.threeBind = "SevenPressed"
		elif GlobalVars.InputThree == 7:
			GlobalVars.threeBind = "EightPressed"
		elif GlobalVars.InputThree == 8:
			GlobalVars.threeBind = "NinePressed"
		elif GlobalVars.InputThree == 9:
			GlobalVars.threeBind = "LeftClick"
		elif GlobalVars.InputThree == 10:
			GlobalVars.threeBind = "RightClick"
		elif GlobalVars.InputThree == 11:
			GlobalVars.threeBind = "MiddleClick"
		elif GlobalVars.InputThree == 12:
			GlobalVars.threeBind = "SpacePressed"
		elif GlobalVars.InputThree == 13:
			GlobalVars.threeBind = "WPressed"
		elif GlobalVars.InputThree == 14:
			GlobalVars.threeBind = "APressed"
		elif GlobalVars.InputThree == 15:
			GlobalVars.threeBind = "SPressed"
		elif GlobalVars.InputThree == 16:
			GlobalVars.threeBind = "DPressed"
		elif GlobalVars.InputThree == 17:
			GlobalVars.threeBind = "QPressed"
		elif GlobalVars.InputThree == 18:
			GlobalVars.threeBind = "EPressed"
			
			
		if GlobalVars.InputFour == 0:
			GlobalVars.fourBind = "OnePressed"
		elif GlobalVars.InputFour == 1:
			GlobalVars.fourBind = "TwoPressed"
		elif GlobalVars.InputFour == 2:
			GlobalVars.fourBind = "ThreePressed"
		elif GlobalVars.InputFour == 3:
			GlobalVars.fourBind = "FourPressed"
		elif GlobalVars.InputFour == 4:
			GlobalVars.fourBind = "FivePressed"
		elif GlobalVars.InputFour == 5:
			GlobalVars.fourBind = "SixPressed"
		elif GlobalVars.InputFour == 6:
			GlobalVars.fourBind = "SevenPressed"
		elif GlobalVars.InputFour == 7:
			GlobalVars.fourBind = "EightPressed"
		elif GlobalVars.InputFour == 8:
			GlobalVars.fourBind = "NinePressed"
		elif GlobalVars.InputFour == 9:
			GlobalVars.fourBind = "LeftClick"
		elif GlobalVars.InputFour == 10:
			GlobalVars.fourBind = "RightClick"
		elif GlobalVars.InputFour == 11:
			GlobalVars.fourBind = "MiddleClick"
		elif GlobalVars.InputFour == 12:
			GlobalVars.fourBind = "SpacePressed"
		elif GlobalVars.InputFour == 13:
			GlobalVars.fourBind = "WPressed"
		elif GlobalVars.InputFour == 14:
			GlobalVars.fourBind = "APressed"
		elif GlobalVars.InputFour == 15:
			GlobalVars.fourBind = "SPressed"
		elif GlobalVars.InputFour == 16:
			GlobalVars.fourBind = "DPressed"
		elif GlobalVars.InputFour == 17:
			GlobalVars.twoBind = "QPressed"
		elif GlobalVars.InputFour == 18:
			GlobalVars.fourBind = "EPressed"
		
		if GlobalVars.InputFive == 0:
			GlobalVars.fiveBind = "OnePressed"
		elif GlobalVars.InputFive == 1:
			GlobalVars.fiveBind = "TwoPressed"
		elif GlobalVars.InputFive == 2:
			GlobalVars.fiveBind = "ThreePressed"
		elif GlobalVars.InputFive == 3:
			GlobalVars.fiveBind = "FourPressed"
		elif GlobalVars.InputFive == 4:
			GlobalVars.fiveBind = "FivePressed"
		elif GlobalVars.InputFive == 5:
			GlobalVars.fiveBind = "SixPressed"
		elif GlobalVars.InputFive == 6:
			GlobalVars.fiveBind = "SevenPressed"
		elif GlobalVars.InputFive == 7:
			GlobalVars.fiveBind = "EightPressed"
		elif GlobalVars.InputFive == 8:
			GlobalVars.fiveBind = "NinePressed"
		elif GlobalVars.InputFive == 9:
			GlobalVars.fiveBind = "LeftClick"
		elif GlobalVars.InputFive == 10:
			GlobalVars.fiveBind = "RightClick"
		elif GlobalVars.InputFive == 11:
			GlobalVars.fiveBind = "MiddleClick"
		elif GlobalVars.InputFive == 12:
			GlobalVars.fiveBind = "SpacePressed"
		elif GlobalVars.InputFive == 13:
			GlobalVars.fiveBind = "WPressed"
		elif GlobalVars.InputFive == 14:
			GlobalVars.fiveBind = "APressed"
		elif GlobalVars.InputFive == 15:
			GlobalVars.fiveBind = "SPressed"
		elif GlobalVars.InputFive == 16:
			GlobalVars.fiveBind = "DPressed"
		elif GlobalVars.InputFive == 17:
			GlobalVars.InputFive = "QPressed"
		elif GlobalVars.InputFive == 18:
			GlobalVars.InputFive = "EPressed"
			
		if GlobalVars.InputSix == 0:
			GlobalVars.sixBind = "OnePressed"
		elif GlobalVars.InputSix == 1:
			GlobalVars.sixBind = "TwoPressed"
		elif GlobalVars.InputSix == 2:
			GlobalVars.sixBind = "ThreePressed"
		elif GlobalVars.InputSix == 3:
			GlobalVars.sixBind = "FourPressed"
		elif GlobalVars.InputSix == 4:
			GlobalVars.sixBind = "FivePressed"
		elif GlobalVars.InputSix == 5:
			GlobalVars.sixBind = "SixPressed"
		elif GlobalVars.InputSix == 6:
			GlobalVars.sixBind = "SevenPressed"
		elif GlobalVars.InputSix == 7:
			GlobalVars.sixBind = "EightPressed"
		elif GlobalVars.InputSix == 8:
			GlobalVars.sixBind = "NinePressed"
		elif GlobalVars.InputSix == 9:
			GlobalVars.sixBind = "LeftClick"
		elif GlobalVars.InputSix == 10:
			GlobalVars.sixBind = "RightClick"
		elif GlobalVars.InputSix == 11:
			GlobalVars.sixBind = "MiddleClick"
		elif GlobalVars.InputSix == 12:
			GlobalVars.sixBind = "SpacePressed"
		elif GlobalVars.InputSix == 13:
			GlobalVars.sixBind = "WPressed"
		elif GlobalVars.InputSix == 14:
			GlobalVars.sixBind = "APressed"
		elif GlobalVars.InputSix == 15:
			GlobalVars.sixBind = "SPressed"
		elif GlobalVars.InputSix == 16:
			GlobalVars.sixBind = "DPressed"
		elif GlobalVars.InputSix == 17:
			GlobalVars.twoBind = "QPressed"
		elif GlobalVars.InputSix == 18:
			GlobalVars.twoBind = "EPressed"
			
			
		if GlobalVars.InputSeven == 0:
			GlobalVars.sevenBind = "OnePressed"
		elif GlobalVars.InputSeven == 1:
			GlobalVars.sevenBind = "TwoPressed"
		elif GlobalVars.InputSeven == 2:
			GlobalVars.sevenBind = "ThreePressed"
		elif GlobalVars.InputSeven == 3:
			GlobalVars.sevenBind = "FourPressed"
		elif GlobalVars.InputSeven == 4:
			GlobalVars.sevenBind = "FivePressed"
		elif GlobalVars.InputSeven == 5:
			GlobalVars.sevenBind = "SixPressed"
		elif GlobalVars.InputSeven == 6:
			GlobalVars.sevenBind = "SevenPressed"
		elif GlobalVars.InputSeven == 7:
			GlobalVars.sevenBind = "EightPressed"
		elif GlobalVars.InputSeven == 8:
			GlobalVars.sevenBind = "NinePressed"
		elif GlobalVars.InputSeven == 9:
			GlobalVars.sevenBind = "LeftClick"
		elif GlobalVars.InputSeven == 10:
			GlobalVars.sevenBind = "RightClick"
		elif GlobalVars.InputSeven == 11:
			GlobalVars.sevenBind = "MiddleClick"
		elif GlobalVars.InputSeven == 12:
			GlobalVars.sevenBind = "SpacePressed"
		elif GlobalVars.InputSeven == 13:
			GlobalVars.sevenBind = "WPressed"
		elif GlobalVars.InputSeven == 14:
			GlobalVars.sevenBind = "APressed"
		elif GlobalVars.InputSeven == 15:
			GlobalVars.sevenBind = "SPressed"
		elif GlobalVars.InputSeven == 16:
			GlobalVars.sevenBind = "DPressed"
		elif GlobalVars.InputSeven == 17:
			GlobalVars.sevenBind = "QPressed"
		elif GlobalVars.InputSeven == 18:
			GlobalVars.sevenBind = "EPressed"
			
			
		if GlobalVars.InputEight == 0:
			GlobalVars.eightBind = "OnePressed"
		elif GlobalVars.InputEight == 1:
			GlobalVars.eightBind = "TwoPressed"
		elif GlobalVars.InputEight == 2:
			GlobalVars.eightBind = "ThreePressed"
		elif GlobalVars.InputEight == 3:
			GlobalVars.eightBind = "FourPressed"
		elif GlobalVars.InputEight == 4:
			GlobalVars.eightBind = "FivePressed"
		elif GlobalVars.InputEight == 5:
			GlobalVars.eightBind = "SixPressed"
		elif GlobalVars.InputEight == 6:
			GlobalVars.eightBind = "SevenPressed"
		elif GlobalVars.InputEight == 7:
			GlobalVars.eightBind = "EightPressed"
		elif GlobalVars.InputEight == 8:
			GlobalVars.eightBind = "NinePressed"
		elif GlobalVars.InputEight == 9:
			GlobalVars.eightBind = "LeftClick"
		elif GlobalVars.InputEight == 10:
			GlobalVars.eightBind = "RightClick"
		elif GlobalVars.InputEight == 11:
			GlobalVars.eightBind = "MiddleClick"
		elif GlobalVars.InputEight == 12:
			GlobalVars.eightBind = "SpacePressed"
		elif GlobalVars.InputEight == 13:
			GlobalVars.eightBind = "WPressed"
		elif GlobalVars.InputEight == 14:
			GlobalVars.eightBind = "APressed"
		elif GlobalVars.InputEight == 15:
			GlobalVars.eightBind = "SPressed"
		elif GlobalVars.InputEight == 16:
			GlobalVars.eightBind = "DPressed"
		elif GlobalVars.InputEight == 17:
			GlobalVars.eightBind = "QPressed"
		elif GlobalVars.InputEight == 18:
			GlobalVars.eightBind = "EPressed"
			
		if GlobalVars.InputNine == 0:
			GlobalVars.nineBind = "OnePressed"
		elif GlobalVars.InputNine == 1:
			GlobalVars.nineBind = "TwoPressed"
		elif GlobalVars.InputNine == 2:
			GlobalVars.nineBind = "ThreePressed"
		elif GlobalVars.InputNine == 3:
			GlobalVars.nineBind = "FourPressed"
		elif GlobalVars.InputNine == 4:
			GlobalVars.nineBind = "FivePressed"
		elif GlobalVars.InputNine == 5:
			GlobalVars.nineBind = "SixPressed"
		elif GlobalVars.InputNine == 6:
			GlobalVars.nineBind = "SevenPressed"
		elif GlobalVars.InputNine == 7:
			GlobalVars.nineBind = "EightPressed"
		elif GlobalVars.InputNine == 8:
			GlobalVars.nineBind = "NinePressed"
		elif GlobalVars.InputNine == 9:
			GlobalVars.nineBind = "LeftClick"
		elif GlobalVars.InputNine == 10:
			GlobalVars.nineBind = "RightClick"
		elif GlobalVars.InputNine == 11:
			GlobalVars.nineBind = "MiddleClick"
		elif GlobalVars.InputNine == 12:
			GlobalVars.nineBind = "SpacePressed"
		elif GlobalVars.InputNine == 13:
			GlobalVars.nineBind = "WPressed"
		elif GlobalVars.InputNine == 14:
			GlobalVars.nineBind = "APressed"
		elif GlobalVars.InputNine == 15:
			GlobalVars.nineBind = "SPressed"
		elif GlobalVars.InputNine == 16:
			GlobalVars.nineBind = "DPressed"
		elif GlobalVars.InputNine == 17:
			GlobalVars.nineBind = "QPressed"
		elif GlobalVars.InputNine == 18:
			GlobalVars.nineBind = "EPressed"
		


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
