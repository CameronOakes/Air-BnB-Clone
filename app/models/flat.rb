class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates :address, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  def average_rating
    reviews.average(:rating)
  end
end
