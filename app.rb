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




get '/admin/words' do
  
  @words = Word.all
  erb :words
end


post '/admin/words/submit' do

  @word = Word.new(params[:word])
  @word.update_attributes(word_length: @word.content.length)	
  if @word.save
  	redirect '/admin/words'
  else
  	"Sorry"
  end
end

