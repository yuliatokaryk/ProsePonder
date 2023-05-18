Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :books
  resources :authors
  resources :notes
end
