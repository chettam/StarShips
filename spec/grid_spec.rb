require_relative 'spec_helper'
require_relative '../models/cell'
describe Grid do

	it "should have size * size number of cells " do

		grid = Grid.create(:size => 10)
		grid.new_grid
		puts grid.inspect
		expect(grid.cells.count).to eq(100)
	end



end