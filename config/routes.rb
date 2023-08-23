Rails.application.routes.draw do
  root "flats#home"
  resources :flats
end
