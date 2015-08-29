class Hive < ActiveRecord::Base
  mount_uploader :image, HiveImageUploader
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true, numericality: {only_integer: true}
end
