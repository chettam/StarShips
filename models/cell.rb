class Cell
  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource
  belongs_to :grid
  belongs_to :ship, key: true, required: false
  	#  'Ships',
  	# :parent_key => [ :id ],  
   #  :child_key  => [ :ship_id ], 



  property :id,   	Serial # Serial means that it will be auto-incremented 
  # property :status,  String
  property :attacked, Boolean
  property :x_position, Integer 
  property :y_position, Integer


  def status
  	if ship
  		if attacked
	  		:hit
	  	else
	  		:occupied
	  	end
	  else
	  	if attacked
	  		:miss
	  	else
	  		:empty
	  	end
	  end
	end



end

