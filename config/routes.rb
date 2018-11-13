Rails.application.routes.draw do
  #ログイン画面
  post "login" => "sessions#create"
  get  "login" =>  "sessions#new"
  #delete "logout" => "sessions#destroy"

  #新規登録画面
  get "signup" => "users#new"

  #ユーザー登録
  post "users/create" => "users#create"

  #ユーザー一覧
  get "users/index" => "users#index"

   #トップ画面予約一覧
   get "home/index" => "home#index" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
