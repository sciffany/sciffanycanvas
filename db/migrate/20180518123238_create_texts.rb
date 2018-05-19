class CreateText < ActiveRecord::Migration[5.2]
  def change
  	create_table :texts do |t|
  		t.string :content
  	end
  end
end
