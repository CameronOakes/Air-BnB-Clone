class FlatsController < ApplicationController
  def home
    @flats = Flat.all
    render 'home'
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @flat
    else
      render :new
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :price, :capacity)
  end
end
