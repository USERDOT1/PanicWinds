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
	AudioServer.set_bus_volume_db(0, $SettingTabs/Audio/MarginContainer2/AudioSettings/MasterSlider.value+10)
	AudioServer.set_bus_volume_db(1, $SettingTabs/Audio/MarginContainer2/AudioSettings/SfxSlider.value+10)
	AudioServer.set_bus_volume_db(2, $SettingTabs/Audio/MarginContainer2/AudioSettings/MusicSlider.value+3)
	AudioServer.set_bus_volume_db(3, $SettingTabs/Audio/MarginContainer2/AudioSettings/ShipVoiceSlider.value+10)
	
func _process(delta):
	GlobalVars.defaultOneBind = $SettingTabs/Input/MarginContainer/VideoSettings/InputOneOptions.selected
	GlobalVars.defaultTwoBind = $SettingTabs/Input/MarginContainer/VideoSettings/InputTwoOptions.selected
	GlobalVars.defaultThreeBind = $SettingTabs/Input/MarginContainer/VideoSettings/InputThreeOptions.selected
	GlobalVars.defaultFourBind = $SettingTabs/Input/MarginContainer/VideoSettings/InputFourOptions.selected
	GlobalVars.defaultFiveBind = $SettingTabs/Input/MarginContainer/VideoSettings/InputFiveOptions.selected
	GlobalVars.defaultSixBind = $SettingTabs/Input/MarginContainer/VideoSettings/InputSixOptions.selected
	GlobalVars.defaultSevenBind = $SettingTabs/Input/MarginContainer/VideoSettings/InputSevenOptions.selected
	GlobalVars.defaultEightBind = $SettingTabs/Input/MarginContainer/VideoSettings/InputEightOptions.selected
	GlobalVars.defaultNineBind = $SettingTabs/Input/MarginContainer/VideoSettings/InputNineOptions.selected
	
	GlobalVars.masterVolumeSave = $SettingTabs/Audio/MarginContainer2/AudioSettings/MasterSlider.value
	GlobalVars.musicVolumeSave = $SettingTabs/Audio/MarginContainer2/AudioSettings/MusicSlider.value
	GlobalVars.sfxVolumeSaved = $SettingTabs/Audio/MarginContainer2/AudioSettings/SfxSlider.value
	GlobalVars.shipVoiceVolumeSaved = $SettingTabs/Audio/MarginContainer2/AudioSettings/ShipVoiceSlider.value
