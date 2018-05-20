class AddLetterCountColumn < ActiveRecord::Migration[5.2]
  def change
	add_column :words, :word_length, :integer
	Word.all.each do |t|
		t.update_attributes(word_length: t.content.length)
	end
  end
end
