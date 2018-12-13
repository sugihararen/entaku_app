# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_current_user, {only: [:index]}
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to home_index_url
    else
      render :new
    end
  end

  def index
    @users = User.all.order(:created_at).reverse_order
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
