Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :books do
    resources :notes, only: [:create]
  end

  resources :notes
  resources :user_books
end
