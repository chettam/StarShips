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
		end_position = origin.x_position + length
    cells.all(x_position: (origin.x_position...end_position), y_position: origin.y_position)

	end

	def vertical_cells(origin,length)
		end_position = origin.y_position + length
    cells.all(y_position: (origin.y_position...end_position), x_position: origin.x_position)
	end
end