class Appointment < ApplicationRecord
  # default_scope { where(delete_at: nil) }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  belongs_to :user
  has_many :notes
end
