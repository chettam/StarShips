require_relative 'spec_helper'
require_relative '../models/cell'
describe Grid do

  # I'm pretty sure there could have been a better test coverage :)
	it "should have size * size number of cells " do
		grid = Grid.create(:size => 10, player_id: 10)
		grid.initialize_cells
		expect(grid.cells.count).to eq(100)
	end
end