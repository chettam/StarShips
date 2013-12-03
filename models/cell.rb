class Cell
  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource
  belongs_to :grid



  property :id,   	Serial # Serial means that it will be auto-incremented 
  property :status,  String
  property :x_position, Integer 
  property :y_position, Integer    


end

