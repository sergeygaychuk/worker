class WorkDay < ActiveRecord::Base
  attr_accessible :day, :start, :stop
  has_many :waste_of_times

  validates_presence_of :day, :start, :stop
end
