class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:index,:create]}

  #新規登録画面
  def new
    @user = User.new
  end

  #ユーザー登録
  def create
    @user = User.new(name: params[:name],
                     email: params[:email],
                     password: params[:password])
    if  @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/top")
    else
      render("users/new")
    end
  end

  #ログイン画面
  def login_form
  
  end

  def login
    @user = User.find_by(name: params[:name],password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/top")
    else
      @error_message = "ユーザー名またはパスワードが間違っています"
      @name = params[:name]
      @password = params[:password]
      render("users/login_form")
    end
  end

  #ユーザー一覧画面
  def index

  end

end
