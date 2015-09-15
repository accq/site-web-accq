class MediaCoverageItem < ActiveRecord::Base
  validates :title, presence: true
  validates :url, url: {message: "n'est pas valide"}, uniqueness: true
  validates :published_on, date: {message: "n'est pas valide"}
  validates :media_type, inclusion: %w(text audio video)
  validates :source, presence: true
  mount_uploader :preview_image, MediaPreviewImageUploader

  def self.text
    where("media_type = ?", "text")
  end
end