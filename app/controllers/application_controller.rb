# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def set_current_user
    if User.find(session[:user_id])
      @current_user = User.find(session[:user_id])
    end
  end

  def authenticate_user
    if @current_user.nil?
      flash[:notice] = 'ログインが必要です'
      redirect_to login_path
    end
  end
end
