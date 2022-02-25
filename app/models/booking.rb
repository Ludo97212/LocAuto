class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :start_at, :end_at, presence: true
  # validates :end_at_after_start_at
end
