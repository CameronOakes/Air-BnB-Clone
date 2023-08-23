Rails.application.routes.draw do
  root to: "pages#home"
  resources :flats, only: [:new, :create, :show]
end
