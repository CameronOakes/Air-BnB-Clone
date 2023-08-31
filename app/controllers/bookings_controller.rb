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
      flash.now[:alert] = @booking.errors.full_messages.to_sentence
      render :new
    end
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @bookings = Booking.where(user: @user)
    else
      @bookings = Booking.where(user: current_user)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.user == current_user
      @booking.destroy
      redirect_to bookings_path, notice: 'Booking was successfully cancelled.'
    else
      redirect_to bookings_path, alert: 'You do not have permission to cancel this booking.'
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
