require 'sinatra'

require 'sinatra/activerecord'
require './config/environments'
require './models/text'
require './models/word'

class App < Sinatra::Base
  
end

get '/' do
  erb :index
end




get '/words' do
  
  @words = Word.all
  erb :words
end


post '/words/submit' do

  @word = Word.new(params[:word])
  if @word.save
  	redirect '/words'
  else
  	"Sorry"
  end
end

