class StarShips < Sinatra::Application
  
 get '/game' do
  	redirect to('/')  if session[:game] == nil
  	unless session[:player].nil?
	  	@available_slots = 0
	  	@ships = player.ships

	  	@grid  = opponent.empty? ? nil : all_cells(opponent.first.id)
  	else 
  		@available_slots =available_slots
  	end

  	erb :game
	 end

	post '/join-game' do
		game_id = params[:game_id]
		session[:game] = game_id
		redirect to('/game')
	end
end