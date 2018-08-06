class District < ActiveRecord::Base
  belongs_to :hive
  has_many :candidates
  has_many :engagements, through: :candidates
end
