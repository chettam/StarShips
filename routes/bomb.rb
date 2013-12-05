class StarShips < Sinatra::Application
  
post '/bomb' do
	if player.playing == true
	target_id =params[:cell]
	target = Cell.first(id: target_id)
	target.attacked =true
	target.inspect
	target.save
	next_turn

	redirect to('/game')
	end
	redirect to('/game')
end


end