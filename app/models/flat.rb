class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :address, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
end
