require_relative 'cell'

class Grid
  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource
  has n, :cells

  property :id,   	Serial # Serial means that it will be auto-incremented 
  property :size,   Integer

	def new_grid
		puts self.size

		self.size.to_i.times do |row_index|
			self.size.to_i.times do |cell_index|
				puts "creating cell at #{row_index} #{cell_index}" 
				Cell.create(:status => :empty ,:x_position => cell_index, :y_position => row_index, :grid_id => self.id )
			end
		end
	end  	




end