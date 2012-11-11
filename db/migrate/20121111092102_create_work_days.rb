class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.date :day
      t.time :start
      t.time :stop
    end
  end
end
