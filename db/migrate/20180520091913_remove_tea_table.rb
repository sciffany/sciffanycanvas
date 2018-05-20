class RemoveTeaTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :teas
  end
end
