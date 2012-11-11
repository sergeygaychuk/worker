# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121111142648) do

  create_table "waste_of_times", :force => true do |t|
    t.integer "duration"
    t.string  "tag"
    t.integer "work_day_id"
  end

  add_index "waste_of_times", ["work_day_id"], :name => "index_waste_of_times_on_work_day_id"

  create_table "work_days", :force => true do |t|
    t.date "day"
    t.time "start"
    t.time "stop"
  end

end
