class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat, only: [:new, :create]

  def new
    @booking = @flat.bookings.new
  end

  def create
    @booking = @flat.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
