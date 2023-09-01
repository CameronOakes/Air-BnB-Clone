Rails.application.routes.draw do
  devise_for :users
  root to: "flats#home"

  resources :flats do
    resources :bookings, only: [:new, :create] do
      resources :reviews, only: [:new, :create]
    end
  end

  resources :users, only: [:show, :edit, :update] do
    resources :bookings, only: [:index]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :bookings, only: [:index]
  end

  resources :bookings, only: [:index, :destroy]
  get 'search', to: 'flats#search', as: 'search_flats'
end
