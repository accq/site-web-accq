class HiveMeeting < ActiveRecord::Base
  belongs_to :hive
  mount_uploader :agenda, DocumentUploader
  mount_uploader :report, DocumentUploader

  def self.past
    where("meeting_date < ?", Date.today).order("meeting_date DESC")
  end

  def self.upcoming
    where("meeting_date >= ?", Date.today).order("meeting_date ASC")
  end

end
