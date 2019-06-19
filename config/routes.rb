Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :letters
  resources :likes
  resources :saved_letters
  resources :today_letters
  resources :today_sentences
  get '/admini', to: 'admin#index'
  get '/my_letters', to: 'letters#my_letters'
  get '/about', to: 'about#index'
  get '/menu', to: 'timeline#index'
  root 'about#index'
end
