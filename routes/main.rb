# encoding: utf-8
class StarShips < Sinatra::Application
  get "/" do
    @title = "Welcome to MyApp"        
    erb :main
  end
end