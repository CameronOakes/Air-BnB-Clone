Rails.application.routes.draw do
  devise_for :users
  root to: "flats#home"
  resources :flats, only: [:new, :create, :show]
end
