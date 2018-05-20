class ChangeLevelsToTwo < ActiveRecord::Migration[5.2]
  def change
	Word.all.each do |t|
		t.update_attributes(difficulty: 3)
	end
  end
end
