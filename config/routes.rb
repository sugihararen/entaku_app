# frozen_string_literal: true
Rails.application.routes.draw do
  post 'login' => 'sessions#create'
  get  'login' => 'sessions#new'
  
  delete "logout" => "sessions#destroy"

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'users/index' => 'users#index'

  get 'home/index' => 'home#index'

  resources :reservation_times 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
