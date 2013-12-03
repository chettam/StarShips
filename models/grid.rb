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
				puts "creating cell at #{row_index} #{cell_index} #{id}" 
				Cell.create(x_position: cell_index, y_position: row_index, grid_id: id)
			end
		end
	end 
end