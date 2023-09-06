class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :start_date, :end_date, presence: true
  validate :no_date_overlap

  def completed?
    end_date < Date.today
  end

  def no_date_overlap
    overlapping_bookings = Booking.where(flat_id: flat_id)
                                  .where.not(id: id)
                                  .where("(start_date <= ? AND end_date >= ?) OR (start_date <= ? AND end_date >= ?) OR (start_date >= ? AND end_date <= ?)",
                                          end_date, start_date, start_date, end_date, start_date, end_date)

    if overlapping_bookings.exists?
      errors.add(:base, "The booking dates overlap with an existing booking.")
      Rails.logger.debug "Overlapping Bookings Detected: #{overlapping_bookings.to_a}"
    end
  end

end
