module Helpers

 def player
		Player.get(session[:player])
 end


end