Rails.application.routes.draw do

  devise_for :users
  root to: "flats#home"

  resources :flats do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]

  get 'search', to: 'flats#search', as: 'search_flats'

end
