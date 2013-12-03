require_relative 'spec_helper'
require_relative '../models/game'
describe Game do

	it "should create a game an initialize players individually" do  
		game = Game.create(name: "DarkVador rules", number_of_players: 2)
		game.initialize_player("JB", :sith)
		expect(game.players.first).to be_a_kind_of(Player)
	end
end