class Candidate < ActiveRecord::Base
  belongs_to :political_party
  belongs_to :district
  has_one :engagement, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :district, presence: true
  validates :political_party, presence: true  
  def full_name
    last_name + (middle_name.present? ? " #{middle_name}" : "")  + ", " + first_name
  end

end
