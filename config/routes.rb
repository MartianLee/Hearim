Rails.application.routes.draw do
  devise_for :users
  resources :letters
  resources :likes
  resources :saved_letters
  resources :today_letters
  resources :today_sentences
  get '/admin', to: 'admin#index'
  get '/my_letters', to: 'letters#my_letters'
  get '/about', to: 'about#index'
  get '/menu', to: 'timeline#index'
  root 'timeline#index'
end
