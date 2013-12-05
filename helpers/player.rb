module Helpers

 def player
		Player.get(session[:player])
 end

 def opponent
 	(current_game.players.reject{|player| player.id == session[:player]}).first
	end

	def next_turn
			player.update(playing: false)
			player.save
			opponent.update(playing: true)
			opponent.save
	end

	def play_first
		if player.playing.nil? && !opponent.nil? 
			puts "setting the first player to play" 
			player.update(playing: true)
			puts player.inspect
			player.save
			opponent.update(playing: false)
			opponent.save
		end
	end


end	