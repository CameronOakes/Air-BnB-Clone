class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy
  has_one :flat, through: :booking
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
