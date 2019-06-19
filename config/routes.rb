Rails.application.routes.draw do
  devise_for :users
  resources :letters
  resources :likes
  resources :saved_letters
  resources :today_letters
  get '/about', to: 'about#index'
  root 'timeline#index'
end
