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


get '/anagram' do
  erb :anagram
end




get '/admin/words' do
  
  @words = Word.all
  erb :words
end


post '/admin/words/submit' do

  @words = params[:word].split(' ')
  @noOfWords = @words.length
  @words.each do |word|
  	@word = Word.new({content: word})
	@word.update_attributes(word_length: @word.content.length)
	@noOfWords -= 1 if @word.save
  end

  if @noOfWords == 0
  	redirect '/admin/words'
  else
  	"Sorry"
  end
end

