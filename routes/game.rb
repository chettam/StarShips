class StarShips < Sinatra::Application
  
  def current_game 
		Game.get(session[:game])
  end

  def available_slots
  	game = current_game
  	game.number_of_players - game.players.count
  end

  def player
		Player.get(session[:player])
  end

  get '/game' do
  	redirect to('/')  if session[:game] == nil
  	unless session[:player].nil?
	  	@available_slots = 0
	  	@ships = player.ships
	  	@grid  = player.grid
  	else 
  		@available_slots =available_slots
  	end

  	erb :game
	 end

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