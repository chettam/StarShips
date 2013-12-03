require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
# DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, 'sqlite:/Users/jbblanc/Documents/dev/starships/data/starships.db')

require_relative 'player'
require_relative 'ship'
require_relative 'grid'
require_relative 'cell' # this needs to be done after datamapper is initialised

# After declaring your models, you should finalise them
DataMapper.finalize

# However, how database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

