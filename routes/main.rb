# encoding: utf-8
class StarShips < Sinatra::Application
  get "/" do
   	# @games = Games.all?()     
    erb :main
  end
end