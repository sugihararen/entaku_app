# frozen_string_literal: true
Rails.application.routes.draw do
  # ログイン
  post 'login' => 'sessions#create'
  get  'login' => 'sessions#new'
  
  #ログアウト
  delete "logout" => "sessions#destroy"

  # 新規登録画面
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  # ユーザー一覧
  get 'users/index' => 'users#index'

  # トップ画面予約一覧
  get 'home/index' => 'home#index'
  post  'home/new' => 'homne#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
