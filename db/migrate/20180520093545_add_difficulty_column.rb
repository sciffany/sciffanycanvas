class AddDifficultyColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :words, :difficulty, :integer
  end
end
