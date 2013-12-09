class Player
	include DataMapper::Resource

	DEFAULT_SIZE = 10

	has n, :ships
	has 1, :grid

	property :id,   	Serial # Serial means that it will be auto-incremented  
	property :name,		String
	property :side,		String
	property :playing, Boolean
	property :grid_size, Integer


	def initialize_grid
		grid = Grid.create(size: grid_size || DEFAULT_SIZE, player: self )
		grid.initialize_cells
	end

	def initialize_ships
		ships = side.to_sym == :jedi ? Ship::SHIP_TYPE_JEDI : Ship::SHIP_TYPE_SITH
		ships.each {|key,value| Ship.create(name: key, type: value, player_id: id)}		
	end


	def place(ship,origin,direction)
		cells = grid.send("#{direction}_cells", origin, ship.type)
		return unless cells
		occupy_cells(ship, cells)
		ship.update( placed: true)
	end

	def occupy_cells(ship,cells)
		cells.each {|cell| cell.update(ship_id: ship.id)}
	end

	def lose?
		!ships.any?{|ship| ship.sunk?}
	end

end