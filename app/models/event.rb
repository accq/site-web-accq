class Event < ActiveRecord::Base
  mount_uploader :image, EventImageUploader
  has_many :participants
  def self.upcoming
    where("start_date >= ?", Date.today).order("start_date ASC")
  end
end
