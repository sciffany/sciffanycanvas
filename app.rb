require 'sinatra'

require 'sinatra/activerecord'
require './config/environments'
require './models/word'

class App < Sinatra::Base
  
end

get '/' do
  erb :index
end


get '/anagram' do


  @words = []
  File.open("./public/wordList2.txt", "r") do |f|
    f.each_line do |line|
      vars = line.split
      ctnt = vars[0]
      freq = vars[1].to_f
      word = {content: ctnt, frequency: freq, word_length: ctnt.length} # some ruby object
      if (word[:frequency]>1.7 and word[:word_length]>5 and word[:word_length]<9)
        @words.push(word)
      end
    end
  end

  @selection = @words.shuffle.first(50)
  @cselection = @selection.map{|word| word[:content]}
  @shuffled = @cselection.map{|word| word.upcase.split('').shuffle}


  #@words = Word.where("frequency>? and word_length > ? and word_length < ?", 1.746, 5, 9)

  # @words.length

  # @cselection = @words.shuffle.first(50).collect(&:content)
  # @shuffled = @cselection.map{|word| word.upcase.split('').shuffle}

  erb :anagram
end


post '/anagram' do
  log(params[:text]);
  File.open("./public/log.txt", 'a') { |file| file.write(params[:text]); file.write("\n"); }
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

