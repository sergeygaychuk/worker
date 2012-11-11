class WasteOfTime < ActiveRecord::Base
  belongs_to :workday
  attr_accessible :duration, :tag
end
