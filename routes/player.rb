class StarShips < Sinatra::Application
  
  post '/add-player' do
  	game = current_game
  	name = params[:name] ; side = params[:side].to_sym
  	player = game.initialize_player(name, side)
  	session[:player] = player.id
		redirect to('/game') 
	end


	post '/join-game' do
		game_id = params[:game_id]
		session[:game] = game_id
		redirect to('/game')
	end

end