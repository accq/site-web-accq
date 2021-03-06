class HiveContact < ActiveRecord::Base
  belongs_to :hive
  validates :full_name, presence: true
  validates :email, email: true, allow_blank: true
end
