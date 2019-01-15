class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: '私の素敵なサイトへようこそ')
  end
end
