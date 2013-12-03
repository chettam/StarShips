require_relative 'spec_helper'
require_relative '../models/player'
describe Player do

	it "should have a grid and some ships" do
		player = Player.create(name: "JB", side: :sith,game_id: 1)
		player.initialize_ships
		player.initialize_grid
		expect(player.ships.length).to eq(5)
		expect(player.grid).to  be_a_kind_of(Grid)

	end

end