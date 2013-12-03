class Game
	include DataMapper::Resource

	has n, :players
	property :id,   	Serial # Serial means that it will be auto-incremented  
	property :name,		String
	property :number_of_players, Integer

	def initialize_player(name, side)
		player = Player.create(name: name, side: side, game_id: id)
		player.initialize_grid
		player.initialize_ships
	end
end