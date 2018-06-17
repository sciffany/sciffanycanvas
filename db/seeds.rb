#str = File.open("./public/wordList2.txt", "r") { |f| f.readline }
  
#Word.create(content: str)


File.open("./public/wordList3.txt", "r") do |f|
  f.each_line do |line|
    vars = line.split
    word = vars[0]
    Word.create(content: word, frequency: vars[1], word_length: word.length)
  end
end
# File is closed automatically at end of block