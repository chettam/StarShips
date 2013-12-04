class Player
	include DataMapper::Resource

	has n, :ships
	has 1, :grid

	property :id,   	Serial # Serial means that it will be auto-incremented  
	property :name,		String
	property :side,		String
	property :playing, Boolean
	property :grid_size, Integer


	def initialize_grid
		grid = Grid.create(size: grid_size,player_id: id )
		grid.initialize_cells
	end

	def initialize_ships
		Ship::SHIP_TYPE_JEDI.each {|key,value| Ship.create(name: key, type: value, player_id: id)} if side.to_sym == :jedi
		Ship::SHIP_TYPE_SITH.each {|key,value| Ship.create(name: key, type: value, player_id: id)} if side.to_sym == :sith
	end

	def place(ship,origin,direction)
		cells=[]
		 if direction == :vertical	  	
	 	  cells =	grid.vertical_cells(origin,ship.type)
	 	elsif  direction == :horizontal
	 		cells = grid.horizontal_cells(origin,ship.type)
	 	end
	 	 if !cells.nil?
	 	 	occupy_cells(ship,cells)
	 	 	ship.update( placed: true)
	 	 end
	end

	def occupy_cells(ship,cells)
		cells.each {|cell| cell.update(ship_id: ship.id)}
	end




end