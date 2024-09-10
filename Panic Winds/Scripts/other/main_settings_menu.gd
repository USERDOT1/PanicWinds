extends Popup
var gamePausedHere = false

# Audio Settings
@onready var master_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/MasterSlider
@onready var music_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/MusicSlider
@onready var sfx_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/SfxSlider


func _ready():
	AudioServer.set_bus_volume_db(0, $SettingTabs/Audio/MarginContainer2/AudioSettings/MasterSlider.value+30)
	AudioServer.set_bus_volume_db(1, $SettingTabs/Audio/MarginContainer2/AudioSettings/SfxSlider.value+10)
	AudioServer.set_bus_volume_db(2, $SettingTabs/Audio/MarginContainer2/AudioSettings/MusicSlider.value-10)
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
