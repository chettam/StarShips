class Game
	include DataMapper::Resource

	has n, :players
	property :id,   	Serial # Serial means that it will be auto-incremented  
	property :name,		String
	property :number_of_players, Integer
	property :grid_size, Integer

	def initialize_player(name, side)
		player = Player.create(name: name, side: side, game_id: id,grid_size: size )
		player.initialize_grid
		player.initialize_ships
		player
	end
end