class AddFrequencyColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :frequency, :float
  end
end
