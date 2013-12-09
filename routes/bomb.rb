class StarShips < Sinatra::Application
  
	post '/bomb' do
		redirect to('/game') unless player.playing?
		target_id =params[:cell]
		target = Cell.first(id: target_id)
		target.attacked =true
		# target.inspect # it's not printed anyway, what's the point?
		target.save
		next_turn
	end


end