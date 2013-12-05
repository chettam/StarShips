class Ship
	include DataMapper::Resource

	SHIP_TYPE_SITH = {
		"Death Star" => 5,
		"Trade Federation BattleShip" => 4,
		"Super Star Destroyer" => 3,
		"Imperial Star Destroyer" => 3,
		"Tie Figther" => 2
	}

		SHIP_TYPE_JEDI = {
		"Tatouin" => 5,
		"Republic Attack Cruiser" => 4,
		"Milenuim Falcon" => 3,
		"Naboo Royal Starship" => 3,
		"X-Wing Figther" => 2
	}

	has n, :cells
	belongs_to :player
	property :id,   	Serial # Serial means that it will be auto-incremented  
	property :name,		String
	property :type,		Integer
	property :placed , Boolean

	def sunk?
		!cells.any?{|cell| cell.status != :hit}
	end
end