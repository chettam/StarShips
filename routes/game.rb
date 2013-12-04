class StarShips < Sinatra::Application
  
  def current_game 
		Game.get(session[:game])
  end

  def available_slots
  	game = current_game
  	game.number_of_players - game.players.count
  end

  get '/game' do
  	redirect to('/')  if session[:game] == nil
  	@available_slots = available_slots
  	erb :game
	 end

  post 'add-player' do
  	game = current_game
  	name = params[:name] ; side = params[:side].to_sym
  	player = game.initialize_player(name, side)
  	session[:player] = player.id
		redirect to('/game') 
	end
end