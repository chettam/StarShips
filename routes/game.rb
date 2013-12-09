class StarShips < Sinatra::Application
  
 get '/game' do
    # There's a bit of mess in this method
    # 1. If you redirect, you should return immediately. Redirect on its own doesn't return
    # 2. If you are rendering erb :game, then there should be no possibility of redirecting later
    # So, there should be at most one redirect OR render per action in any case    
  	redirect to('/') if session[:game].nil?
  	unless session[:player].nil?
	  	@available_slots = 0
	  	@ships = player.ships

	  	@grid  = opponent.nil? ? nil : all_cells(opponent.id)
  	else 
  		@available_slots =available_slots
  	end

  	erb :game
  	if current_game.over?
  		current_game.destroy
  		session[:game] =nil
  		session[:player] =nil
  		redirect to('/')
  	end
end

	post '/join-game' do
		session[:game] = params[:game_id]		 
		redirect to('/game')
	end
end