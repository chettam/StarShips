require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
#DataMapper::Logger.new(STDOUT, :debug)

# you have starships.db and startships.db Just a typo, I know, but don't check in incorrect file at all

# don't use absolute paths – your tests won't run on any other machine
DataMapper.setup(:default, "sqlite:#{Dir.pwd}/data/starships.db")

require_relative 'player'
require_relative 'game'
require_relative 'ship'
require_relative 'grid'
require_relative 'cell' # this needs to be done after datamapper is initialised

# After declaring your models, you should finalise them
DataMapper.finalize

# However, how database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

