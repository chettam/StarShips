# encoding: utf-8
require 'sinatra'



class StarShips < Sinatra::Application
  enable :sessions
  set :session_secret, "cedvjrnvoirgbruvgovieirvjerobge"
end

# well done for breaking it down into smaller files
require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'