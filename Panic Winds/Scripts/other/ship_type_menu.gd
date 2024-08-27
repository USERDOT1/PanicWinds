extends Popup

func _ready():
	if get_parent().get_parent() == GlobalVars.currentPlayer:
		GlobalVars.currentShipModelMenu = self
func _process(delta):
	if $VideoSettings/ShipModelOptions.get_selected_id() == 0:
			$VideoSettings/Stats.text = "- Fuel Storage: 60\n- Energy Storage: 60\n- Oxygen Storage: 60\n- Damage Multiplyer: 1.0\n- Speed Multiplyer: 1.0\n- Ship Armor: 2"
			$VideoSettings/Description.text = "The Default ship model with low armor, decent storage, and normal speed"
			if GlobalVars.drebBought:
				if GlobalVars.drebEquipped == false:
					$VideoSettings/BuyOrEquip.text = "Equip"
				else:
					$VideoSettings/BuyOrEquip.text = "Equipped"
			else:
				$VideoSettings/BuyOrEquip.text = "Buy (10)"
				
	if $VideoSettings/ShipModelOptions.get_selected_id() == 1:
		$VideoSettings/Stats.text = "- Fuel Storage: 40\n- Energy Storage: 40\n- Oxygen Storage: 40\n- Damage Multiplyer: 1.0\n- Speed Multiplyer: 1.5\n- Ship Armor: 0"
		$VideoSettings/Description.text = "An agile and quick ship model with no armor with low storage"
		if GlobalVars.blickBought:
			if GlobalVars.blickEquipped == false:
				$VideoSettings/BuyOrEquip.text = "Equip"
			else:
				$VideoSettings/BuyOrEquip.text = "Equipped"
		else:
			$VideoSettings/BuyOrEquip.text = "Buy (75)"
			
	if $VideoSettings/ShipModelOptions.get_selected_id() == 2:
		$VideoSettings/Stats.text = "- Fuel Storage: 86\n- Energy Storage: 70\n- Oxygen Storage: 80\n- Damage Multiplyer: 1.0\n- Speed Multiplyer: 0.75\n- Ship Armor: 8"
		$VideoSettings/Description.text = "A slow, bulky and heavily armored ship with high storage"
		if GlobalVars.titanBought:
			if GlobalVars.titanEquipped == false:
				$VideoSettings/BuyOrEquip.text = "Equip"
			else:
				$VideoSettings/BuyOrEquip.text = "Equipped"
		else:
			$VideoSettings/BuyOrEquip.text = "Buy (85)"
	if $VideoSettings/ShipModelOptions.get_selected_id() == 3:
		$VideoSettings/Stats.text = "- Fuel Storage: 70\n- Energy Storage: 70\n- Oxygen Storage: 70\n- Damage Multiplyer: 1.5\n- Speed Multiplyer: 1.5\n- Ship Armor: 4"
		$VideoSettings/Description.text = "A highly refined elite ship"
		if GlobalVars.sickleBought:
			if GlobalVars.sickleEquipped == false:
				$VideoSettings/BuyOrEquip.text = "Equip"
			else:
				$VideoSettings/BuyOrEquip.text = "Equipped"
		else:
			$VideoSettings/BuyOrEquip.text = "Buy (150)"
	if $VideoSettings/ShipModelOptions.get_selected_id() == 4:
		$VideoSettings/Stats.text = "- Fuel Storage: 80\n- Energy Storage: 80\n- Oxygen Storage: 80\n- Damage Multiplyer: 2\n- Speed Multiplyer: 2\n- Ship Armor: 6"
		$VideoSettings/Description.text = "The most elite streamlined ship in the sector, those valuing their lives should steer clear"
		if GlobalVars.scytheBought:
			if GlobalVars.scytheEquipped == false:
				$VideoSettings/BuyOrEquip.text = "Equip"
			else:
				$VideoSettings/BuyOrEquip.text = "Equipped"
		else:
			$VideoSettings/BuyOrEquip.text = "Buy (300)"
				

	if GlobalVars.drebEquipped:
		#Dreb
		GlobalVars.maxFuel = 60
		GlobalVars.maxEnergy = 60
		GlobalVars.maxOxygen = 60
		GlobalVars.shipArmor = 2
		GlobalVars.shipSpeedMultiplyer = 1
		GlobalVars.shipDamageMultiplyer = 1
		
	if GlobalVars.blickEquipped:
		#Blick
		GlobalVars.maxFuel = 40
		GlobalVars.maxEnergy = 40
		GlobalVars.maxOxygen = 40
		GlobalVars.shipArmor = 0
		GlobalVars.shipSpeedMultiplyer = 1.4
		GlobalVars.shipDamageMultiplyer = 1
		
	if GlobalVars.titanEquipped:
		#Titan
		GlobalVars.maxFuel = 86
		GlobalVars.maxEnergy = 70
		GlobalVars.maxOxygen = 80
		GlobalVars.shipArmor = 8 
		GlobalVars.shipSpeedMultiplyer = 0.75
		GlobalVars.shipDamageMultiplyer = 1
	
	if GlobalVars.sickleEquipped:
		#Sickle
		GlobalVars.maxFuel = 70
		GlobalVars.maxEnergy = 70
		GlobalVars.maxOxygen = 70
		GlobalVars.shipArmor = 4
		GlobalVars.shipSpeedMultiplyer = 1.5 
		GlobalVars.shipDamageMultiplyer = 1.5
		
	if GlobalVars.scytheEquipped:
		#Scythe
		GlobalVars.maxFuel = 80
		GlobalVars.maxEnergy = 80
		GlobalVars.maxOxygen = 80
		GlobalVars.shipArmor = 6
		GlobalVars.shipSpeedMultiplyer = 2
		GlobalVars.shipDamageMultiplyer = 2

func _on_buy_or_equip_pressed():
	if $VideoSettings/ShipModelOptions.get_selected_id() == 0:
		if GlobalVars.drebBought:
			GlobalVars.drebEquipped = true
			GlobalVars.blickEquipped = false   
			GlobalVars.titanEquipped = false
			GlobalVars.sickleEquipped = false
			GlobalVars.scytheEquipped = false
		else:
			if GlobalVars.creds >= 10:
				GlobalVars.creds -= 10
				$BuySfx.play()
				GlobalVars.drebBought = true
			else:
				$CantAfford.play()
			
	if $VideoSettings/ShipModelOptions.get_selected_id() == 1:
		if GlobalVars.blickBought:
			GlobalVars.drebEquipped = false
			GlobalVars.blickEquipped = true
			GlobalVars.titanEquipped = false
			GlobalVars.sickleEquipped = false
			GlobalVars.scytheEquipped = false
		else:
			if GlobalVars.creds >= 75:
				GlobalVars.creds -= 75
				$BuySfx.play()
				GlobalVars.blickBought = true
			else:
				$CantAfford.play()
	if $VideoSettings/ShipModelOptions.get_selected_id() == 2:
		if GlobalVars.titanBought:
			GlobalVars.drebEquipped = false
			GlobalVars.blickEquipped = false
			GlobalVars.titanEquipped = true
			GlobalVars.sickleEquipped = false
			GlobalVars.scytheEquipped = false
		else:
			if GlobalVars.creds >= 85:
				GlobalVars.creds -= 85
				$BuySfx.play()
				GlobalVars.titanBought = true
			else:
				$CantAfford.play()
	if $VideoSettings/ShipModelOptions.get_selected_id() == 3:
		if GlobalVars.sickleBought:
			GlobalVars.drebEquipped = false
			GlobalVars.blickEquipped = false
			GlobalVars.titanEquipped = false
			GlobalVars.sickleEquipped = true
			GlobalVars.scytheEquipped = false
		else:
			if GlobalVars.creds >= 150:
				GlobalVars.creds -= 150
				$BuySfx.play()
				GlobalVars.sickleBought = true
			else:
				$CantAfford.play()
	if $VideoSettings/ShipModelOptions.get_selected_id() == 4:
		if GlobalVars.scytheBought:
			GlobalVars.drebEquipped = false
			GlobalVars.blickEquipped = false
			GlobalVars.titanEquipped = false
			GlobalVars.sickleEquipped = true
			GlobalVars.scytheEquipped = true
		else:
			if GlobalVars.creds >= 300:
				GlobalVars.creds -= 300
				$BuySfx.play()
				GlobalVars.scytheBought = true
			else:
				$CantAfford.play()
