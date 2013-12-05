class StarShips < Sinatra::Application
  
 get '/game' do
  	redirect to('/')  if session[:game] == nil
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
		game_id = params[:game_id]
		session[:game] = game_id
		redirect to('/game')
	end
end