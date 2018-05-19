class CreateWord < ActiveRecord::Migration[5.2]
  def up
  	create_table :words do |t|
  		t.string :content
  	end
  end
end
