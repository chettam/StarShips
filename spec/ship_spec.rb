require_relative 'spec_helper'
require_relative '../models/ship'
describe Ship do

		it "should place on the grid" do
			player = Player.create(:name => "JB", :side => :sith,game_id: 1)
			player.initialize_grid
			player.initialize_ships
			origin = player.grid.cells.first
			direction = "horizontal"
			player.place(player.ships.first,origin,direction)
			expect(player.grid.cells.first.ship_id).to eq (player.ships.first.id)
			expect(player.ships.first.placed).to be_true
		end

end