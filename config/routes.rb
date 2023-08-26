Rails.application.routes.draw do
  devise_for :users
  root to: "flats#home"

  resources :flats do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]
end
