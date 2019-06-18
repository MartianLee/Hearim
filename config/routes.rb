Rails.application.routes.draw do
  devise_for :users
  resources :letters
  resources :likes
  get '/saved_letters', to: 'saved_letter#index'
  get '/about', to: 'about#index'
  root 'timeline#index'
end
