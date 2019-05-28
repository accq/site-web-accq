class Workshop < ActiveRecord::Base
  has_many :workshop_registrations
  validates :name, presence: true
  validates :starts_at, date: true
#  validates :ends_at, date: true
  attr_accessor :start_date, :start_time, :end_date, :end_time
  before_validation :set_starts_at

  def slots_left
    self.available_slots - self.workshop_registrations.count
  end

  def set_starts_at
    self.starts_at = (self.start_date + " " + self.start_time).in_time_zone("America/New_York")
  end

  def self.active
    where("Date(starts_at) >= ?", Time.zone.now.at_beginning_of_day)
  end
end
