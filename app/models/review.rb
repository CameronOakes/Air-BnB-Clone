class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :flat#, through: :bookings
end
