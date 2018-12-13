# frozen_string_literal: true

class SessionsController < ApplicationController
  def new;
    @user = User.new
  end

  def create
    @user = User.find_by(name: session_params[:name])
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      redirect_to home_index_url
    else
      flash.now[:error] = 'ユーザー名またはパスワードが間違っています'
      @user = User.new(name: session_params[:name],password:session_params[:password])
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'ログアウトしました'
    redirect_to login_url
  end

  def session_params
    params.require(:user).permit(:password,:name)
  end
end
