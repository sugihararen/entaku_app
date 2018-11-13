class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:index,:create]}

  include ActiveModel::ForbiddenAttributesProtection
  

  #新規登録画面
  def new
    @user = User.new
  end

  #ユーザー登録
  def create
    @user = User.new(name: params[:name],email: params[:email],password: params[:password])
    if  @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/home/index")
    else
      render "new"
    end
  end

  
  #ユーザー一覧画面
  def index

  end

end
