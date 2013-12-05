require_relative 'cell'

class Grid
  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource
  has n, :cells 
  belongs_to :player

  property :id,   	Serial # Serial means that it will be auto-incremented 
  property :size,   Integer

	def initialize_cells
		size.times do |row_index|
			size.times do |cell_index|
				Cell.create(x_position: cell_index, y_position: row_index, grid_id: id)
			end
		end
	end 


	def horizontal_cells(origin,length)
		cell_array = []
		end_position = origin.x_position + length
    	cell_array = cells.all(x_position: (origin.x_position...end_position), y_position: origin.y_position)
    	!all_empty?(cell_array) || out_of_range?(origin.x_position, length) ? nil : cell_array
	end

	def vertical_cells(origin,length)
		cell_array = []
		end_position = origin.y_position + length
		cell_array = cells.all(y_position: (origin.y_position...end_position), x_position: origin.x_position)
   		!all_empty?(cell_array) || out_of_range?(origin.y_position, length) ? nil : cell_array
	end

	def out_of_range?(origin, length)
		origin + length > size 
	end

	def all_empty?(cells)
		cells.select{|cell| cell.status != :empty}.length > 0 ? false : true 
	end
end