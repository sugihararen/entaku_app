Rails.application.routes.draw do
  get 'users/index'
 
  
  #ログイン画面
  post "login" => "users#login"
  get "login" => "users#login_form"

  #新規登録画面
  get "signup" => "users#new"

  #ユーザー登録
  post "users/create" => "users#create"

  #トップ画面
  get "top" => "home#top" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
