class WasteOfTime < ActiveRecord::Base
  belongs_to :work_day
  attr_accessible :duration, :tag

  validates_presence_of :duration, :tag, :work_day_id
end
