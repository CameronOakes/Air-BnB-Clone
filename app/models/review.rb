class Review < ApplicationRecord
  belongs_to :booking
  has_one :flat, through: :booking

end
