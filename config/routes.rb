Rails.application.routes.draw do
  root "flats#home"
  resources :flats, only: [:new, :create, :show]
end
