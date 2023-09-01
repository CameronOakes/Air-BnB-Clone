class FlatsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :home]

  def home
    @flats = Flat.all
    render 'home'
  end

  def show
    @flat = Flat.find(params[:id])
    @reviews = @flat.reviews
  end


  def new
    @flat = Flat.new
  end

  def create
    @flat = current_user.flats.build(flat_params)
    if @flat.save
      redirect_to flats_path, notice: 'Flat was successfully created.'
    else
      render :new
    end
  end

  def index
    @flats = Flat.order(:id)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to flats_path, notice: 'Flat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, notice: 'Flat was successfully deleted.'
  end

  def search
    if params[:location].present?
      @flats = Flat.where('address ILIKE ?', "%#{params[:location]}%")
    else
      @flats = Flat.all
    end
    render :index
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :price, :capacity, :photo)
  end
end
