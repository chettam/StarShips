class Cell
  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource

  

  property :id,   	Serial # Serial means that it will be auto-incremented 
  property :status,  String
  property :occupied,  Boolean
  property :x_position, Integer 
  property :y_position, Integer    


end

