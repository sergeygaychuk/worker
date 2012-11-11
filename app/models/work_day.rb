class WorkDay < ActiveRecord::Base
  attr_accessible :day, :start, :stop
  has_many :waste_of_times
end
