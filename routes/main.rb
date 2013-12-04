# encoding: utf-8
class StarShips < Sinatra::Application
  def available_games
  	games = Game.all
  	games.nil? ? [] : games.select{|game| game.available_slots > 0}
	end


  get "/" do
		redirect to('/game')  if session[:game] != nil
		session[:game] = nil
		session[:player] = nil
		@available_games = available_games
    erb :main
  end 
end