module Helpers

	def current_game 
		Game.get(session[:game])
  end

  def available_slots
  	game = current_game
  	game.number_of_players - game.players.count
  end


end