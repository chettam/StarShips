module Helpers

 def player
		Player.get(session[:player])
 end

 def opponent
 	current_game.players.reject{|player| player.id == session[:player]}
	end


end