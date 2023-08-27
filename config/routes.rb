Rails.application.routes.draw do
  root "flats#home"
  resources :flats, only: [:new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index]
end
