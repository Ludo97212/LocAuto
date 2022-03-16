class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :brand, :model, :year_of_production, :address, :price_per_day, :engine, :fuel, :kilometers, :seats, presence: true
  validates :kilometers, :seats, :price_per_day, numericality: { greater_than: 0, only_integer: true }
  validates :year_of_production, numericality: { less_than_or_equal_to: Time.now.year, only_integer: true }
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
