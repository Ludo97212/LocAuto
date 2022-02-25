class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :brand, :model, :address, presence: true
  validates :price_per_day, numericality: { greater_than: 0, only_integer: true }
  has_one_attached :photo
end
