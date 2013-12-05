class StarShips < Sinatra::Application
  
  post '/place-ship' do
		coordinates = params[:coordinates]
		direction   = params[:direction]
    cell = select_cell(coordinates)
    ship =  current_ship(params[:ship])
    player.place(ship,cell,direction)
    redirect to('/game')
	end
end
