class Player
	include DataMapper::Resource

	has n, :ships
	has 1, :grid

	property :id,   	Serial # Serial means that it will be auto-incremented  
	property :name,		String
	property :side,		String


	def initialize_grid
		grid = Grid.create(size: 10,player_id: id )
		grid.initialize_cells
	end

	def initialize_ships
		Ship::SHIP_TYPE_JEDI.each {|key,value| Ship.create(name: key, type: value, player_id: id)} if side.to_sym == :jedi
		Ship::SHIP_TYPE_SITH.each {|key,value| Ship.create(name: key, type: value, player_id: id)} if side.to_sym == :sith
	end




end