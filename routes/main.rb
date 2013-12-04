# encoding: utf-8
class StarShips < Sinatra::Application
  get "/" do
    @title = "Welcome to StarShips, may the force be with you"        
    erb :main
  end
end