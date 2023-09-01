class ReviewsController < ApplicationController
  before_action :set_booking_and_flat, only: [:new, :create]


  def index
    if params[:flat_id]
      @flat = Flat.find(params[:flat_id])
      @reviews = @flat.reviews
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @reviews = Review.joins(booking: :user).where(bookings: { user: @user })
    else
      @reviews = Review.all
    end
  end

  def new
    unless @booking.completed?
      redirect_to root_path, alert: "You can't review a booking that hasn't taken place!"
      return
    end
    @review = @flat.reviews.build
  end


  def create
    @review = @flat.reviews.build(review_params)
    @review.booking = @booking
    unless @booking.completed?
      redirect_to root_path, alert: "You can't review a booking that hasn't taken place!"
      return
    end
    if @review.save
      redirect_to flat_path(@review.flat), notice: 'Review was successfully created.'

    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_booking_and_flat
    @booking = Booking.find(params[:booking_id])
    @flat = @booking.flat
  end
end
