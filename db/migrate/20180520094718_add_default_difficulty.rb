class AddDefaultDifficulty < ActiveRecord::Migration[5.2]
  def change
  	change_column :words, :difficulty, :integer, :default => 2
  end
end
