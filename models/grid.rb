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
				Cell.create(x_position: cell_index, y_position: row_index, grid: self)
			end
		end
	end 


	def horizontal_cells(origin,length)
		cells_subset(origin, length, :x_position)
	end

  def cells_subset(origin, length, direction)
    return if cells_not_empty_or_out_of_range(origin.send(direction), length)    
    other_direction = ([:x_position, :y_position] - [direction]).first
    end_position = origin.send(direction) + length
    cells.all(direction => (origin.send(direction)...end_position), 
              other_direction => origin.send(other_direction))    
  end

  def cells_not_empty_or_out_of_range(position, length)
    !cells.all?(&:empty?) || out_of_range?(position, length)
  end

	def vertical_cells(origin,length)
		cells_subset(origin, length, :y_position)
	end

	def out_of_range?(origin, length)
		origin + length > size 
	end

end