# encoding: utf-8
require 'sinatra'



class StarShips < Sinatra::Application
  enable :sessions


end

require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'