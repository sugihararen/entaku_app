# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :googleusers, controllers: {
    omniauth_callbacks: "googleusers/omniauth_callbacks"
} 
  post   'login'          => 'sessions#create'
  get    'login'          => 'sessions#new'
  delete 'logout'         => 'sessions#destroy'
  get    'signup'         => 'users#new'
  post   'signup'         => 'users#create'
  delete 'users/destory'  => 'users#destroy'
  get    'users/index'    => 'users#index'
  get    'home/index'     => 'home#index'
  get    'home/show'      => 'home#show'
  resources :reservation_times
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
