class WorkshopRegistration < ActiveRecord::Base
  belongs_to :workshop
  validates :name, presence: true
  validates :email, presence: true, email: true, uniqueness: {scope: :workshop_id}
  validates :phone, presence: true
end
