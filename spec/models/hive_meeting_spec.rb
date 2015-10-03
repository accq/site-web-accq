require 'rails_helper'

RSpec.describe HiveMeeting, :type => :model do
  fixtures :hives, :hive_meetings
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

  it "must have a valid meeting date" do
    meeting = HiveMeeting.new(meeting_date: "I'm not a date")
    expect(meeting).to have_exactly(1).error_on(:meeting_date)
  end

  it "must have a valid meeting time" do
    meeting = HiveMeeting.new(meeting_time: "Not a time at all")
    expect(meeting).to have_exactly(1).error_on(:meeting_time)
  end

  it "is valid when all fields are entered correctly" do
    meeting = HiveMeeting.new(location: "Restaurant XYZ", address: "1234 bonjour", meeting_date: Date.today, meeting_time: Time.now)
    expect(meeting).to be_valid
  end

  context "Class methods" do
    it "has a class method to return past meetings" do
      meetings = hives(:vive_le_quebec).hive_meetings.upcoming
      expect(meetings.count).to eq 1
    end

    it "has a class method to return upcoming meetings" do
      meetings = hives(:vive_le_quebec).hive_meetings.past
      expect(meetings.count).to eq 1
    end
  end
end
