require "spec_helper"

describe WorkDay do
  it { should have_many :waste_of_times }

  it { should allow_mass_assignment_of :day }
  it { should allow_mass_assignment_of :start }
  it { should allow_mass_assignment_of :stop }
end
