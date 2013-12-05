class StarShips < Sinatra::Application
  
post '/bomb' do
	target_id =params[:cell]
	target = Cell.first(id: target_id)
	target.attacked =true
	target.inspect
	target.save
	redirect to('/game')
end


end