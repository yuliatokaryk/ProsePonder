Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :books, except: [:new]
  resources :authors, except: [:new]
  resources :notes
  resources :user_books
end
