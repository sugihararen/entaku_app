class SessionsController < ApplicationController
  #ログインページ
  def new
  end

  #ログイン
  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to home_index_url
    else
      @error_message = "ユーザー名またはパスワードが間違っています"
      @name = params[:name]
      @password = params[:password]
      render :new
    end
  end

  #ログアウト
  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to login_url
  end

end
