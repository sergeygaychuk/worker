class CreateWasteOfTimes < ActiveRecord::Migration
  def change
    create_table :waste_of_times do |t|
      t.integer :duration
      t.string :tag
      t.references :work_day
    end
    add_index :waste_of_times, :work_day_id
  end
end
