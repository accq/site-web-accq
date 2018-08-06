class Engagement < ActiveRecord::Base
  belongs_to :candidate
  validates :candidate_id, uniqueness: true, presence: true
  validates :status, presence: true
  attr_accessor :candidate_name # for autocomplete purpose
  validate :check_candidate_name

  def check_candidate_name
    if self.errors[:candidate_id].count > 0
      self.errors.add(:candidate_name, self.errors[:candidate_id].first)
    end
  end
end
