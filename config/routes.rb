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

   # error pages
   %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
end
