Rails.application.routes.draw do
  resources :users
  resources :letters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'timeline#index'
end
