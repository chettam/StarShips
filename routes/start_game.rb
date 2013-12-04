# encoding: utf-8
class StarShips < Sinatra::Application
  get '/start-game' do
  erb :start_game
  end


  post '/start-game' do 
		game_name         = params[:game_name]
		number_of_players = params[:number_of_players]
		grid_size				  = params[:grid_size]
		game = Game.create(name: game_name, number_of_players: number_of_players,grid_size: grid_size)
		session[:game] = game.id
		redirect to('/')
		#redirect "/play?game=#{new_game.identifier}&player=#{new_game.players[0].identifier}",307
	end


end