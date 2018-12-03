class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to home_index_url
    else
      flash.now[:error] = "ユーザー名またはパスワードが間違っています"
      @name = params[:name]
      @password = params[:password]
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to login_url
  end
end
