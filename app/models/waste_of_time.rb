class WasteOfTime < ActiveRecord::Base
  belongs_to :work_day
  attr_accessible :duration, :tag
end
