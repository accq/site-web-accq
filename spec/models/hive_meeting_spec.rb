require 'rails_helper'

RSpec.describe HiveMeeting, :type => :model do
  it "is invalid without a location" do
    meeting = HiveMeeting.new(location: nil)
    expect(meeting).to have_exactly(1).error_on(:location)
  end

  it "is invalid without an address" do
    meeting = HiveMeeting.new(address: nil)
    expect(meeting).to have_exactly(1).error_on(:address)
  end

  it "is invalid without a meeting date" do
    meeting = HiveMeeting.new(meeting_date: nil)
    expect(meeting).to have_exactly(1).error_on(:meeting_date)
  end

  it "is invalid without a meeting time" do
    meeting = HiveMeeting.new(meeting_time: nil)
    expect(meeting).to have_exactly(1).error_on(:meeting_time)
  end
end
