module Helpers

	def current_game 
		Game.get(session[:game])
  end

  def available_slots
  	game = current_game
  	game.number_of_players - game.players.count
  end

  def all_cells(player_id)
  	grid =Grid.first(player_id: player_id)
  end
end