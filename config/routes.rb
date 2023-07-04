Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :books

  resources :notes
  resources :user_books
end
