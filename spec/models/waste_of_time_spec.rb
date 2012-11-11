require "spec_helper"

describe WasteOfTime do
  it { should belong_to :work_day }

  it { should allow_mass_assignment_of :duration }
  it { should allow_mass_assignment_of :tag }

  it { should validate_presence_of :duration }
  it { should validate_presence_of :tag }
  it { should validate_presence_of :work_day_id }
end
