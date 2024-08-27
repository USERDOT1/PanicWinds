extends Node

#Game
var currentCamera
var gamePaused = false
var blockSelected
var currentScene
var currentAudioPlayerShip
var creds = 400
var slider
var radarDisplay
var radarEnabled = false
var barrierUp = false
var hasRadar = false
var currentRadarCollider
var currentNormalUi
var playerDetectionPoint:Vector2
var stationNumber:int = 4
var roundStart = 100
var cloaked = false
#Building
var placementRotation = 0
var placementType = 0
var buildingEnabled = false
var currentBuildingUi
var xPlacement = 0
var yPlacement = 0
var placedBlocks = [Vector2(0,0)]
var buildingBlocks = [Vector2(0,0)]

#Ammo
var lightRounds: int = 0
var heavyRounds: int = 0
var missiles: int = 0

#Resources
var Fuel: float = 60
var maxFuel: float = 60
var Energy: float = 60
var maxEnergy: float = 60
var Oxygen: float = 60
var maxOxygen: float = 60

#Multiplayer
var gameCode = "among"
var peer
var adress = "172.88.97.9" # subject to change in the future :|  "192."
var port = 8910 # subject to change in the future :|

#Ship
var xVelocity = 0
var yVelocity = 0
var currentPlayer
var playerName = "192.168.86.82"
var shipWeight = 5
var PlayersNode
var inStation = true
var detectionDisabled
var currentBarrier = null
var coreHealth
var coreDestroyed = false
var lolTrue = false
var canActivateBarrier = false
var radarRotation = 0
var turnSpeed = 0.01
var shipDamageMultiplyer:float = 1
var shipSpeedMultiplyer:float = 1
var shipArmor
var currentShipModelMenu

# Ship Models
var drebBought = true
var blickBought = false
var titanBought = false
var sickleBought = false
var scytheBought = false


var drebEquipped = true
var blickEquipped = false
var titanEquipped = false
var sickleEquipped = false
var scytheEquipped = false

# upgrades (for future implementation)
var upgradeCount
var upgradeNames = []
var upgradeCosts = []

# Inputs
var InputOne
var InputTwo
var InputThree
var InputFour
var InputFive
var InputSix
var InputSeven
var InputEight
var InputNine

var oneBind:String = "InputOne"
var twoBind:String = "InputTwo"
var threeBind:String = "InputThree"
var fourBind:String = "InputFour"
var fiveBind:String = "InputFive"
var sixBind:String = "InputSix"
var sevenBind:String = "InputSeven"
var eightBind:String = "InputEight"
var nineBind:String = "InputNine"


var defaultOneBind:int
var defaultTwoBind:int
var defaultThreeBind:int
var defaultFourBind:int
var defaultFiveBind:int
var defaultSixBind:int
var defaultSevenBind:int
var defaultEightBind:int
var defaultNineBind:int

var masterVolumeSave
var musicVolumeSave
var shipVoiceVolumeSaved
var sfxVolumeSaved
var currentPauseMenu
