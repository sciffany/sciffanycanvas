class Tea < ActiveRecord::Migration[5.2]
  def up
  	create_table :teas do |t|
  		t.string :flavor
  	end

  end
end
