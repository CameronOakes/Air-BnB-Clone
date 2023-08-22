class FlatsController < ApplicationController
  def home
    @flats = Flat.all
  end
end
