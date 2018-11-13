class SessionsController < ApplicationController
  
  def new
  
  end

  def create
    @user = User.find_by(name: params[:name],password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/home/index")
    else
      @error_message = "ユーザー名またはパスワードが間違っています"
      @name = params[:name]
      @password = params[:password]
      render("sessions/new")
    end
  end

end
