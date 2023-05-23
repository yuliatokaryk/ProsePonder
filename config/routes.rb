Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :books, except: [:new] do
    resources :notes, only: [:create]
  end

  resources :authors, except: [:new]
  resources :notes, only: [:show]
  resources :user_books
end
