require 'sinatra'

require 'sinatra/activerecord'

class App < Sinatra::Base
  
end

get '/' do
  erb :index
end