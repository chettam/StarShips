# encoding: utf-8
class StarShips < Sinatra::Application
  get "/" do
		redirect to('/game')  if session[:game] != nil
		session[:game] = nil
		session[:player] = nil
   	puts session[:game]
    erb :main
  end
end