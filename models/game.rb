class Game
	include DataMapper::Resource

	has n, :players
	property :id,   	Serial # Serial means that it will be auto-incremented  
	property :name,		String
	property :number_of_players, Integer
	property :grid_size, Integer

	def initialize_player(name, side)
		player = Player.create(name: name, side: side, game_id: id,grid_size: grid_size )
		player.initialize_grid
		player.initialize_ships
		player
	end

	def available_slots	 
	 self.number_of_players - (self.players.count || 0)
	end


	def over?
		# shouldn't this be opposite? If any player lost, the game is over, right?
		# in any case, no tests for this :(
		!players.any?{|player| player.lose?}
	end
end