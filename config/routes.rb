Rails.application.routes.draw do

  devise_for :users
  root to: "flats#home"

  resources :flats do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :bookings, only: [:index]
  end

  resources :bookings, only: [:index, :destroy]

  get 'search', to: 'flats#search', as: 'search_flats'

end
