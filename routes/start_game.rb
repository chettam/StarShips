# encoding: utf-8
class StarShips < Sinatra::Application
  get '/start-game' do
  erb :start_game
  end


  post '/start-game' do 
		game_name = params[:game_name]
		number_of_players = params[:number_of_players]
		grid_size				  = params[:grid_size]
		number_of_ships   = params[:number_of_ships]
		new_game = new_game(number_of_players,number_of_ships,grid_size,game_name)
		@@games << new_game
		redirect "/play?game=#{new_game.identifier}&player=#{new_game.players[0].identifier}",307
	end


end