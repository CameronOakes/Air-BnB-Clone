class FlatsController < ApplicationController
  def home
    @flats = Flat.all
    render 'home'
  end
end
