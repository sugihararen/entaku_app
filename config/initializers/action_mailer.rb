# TODO: SMTPサーバを準備して、設定を変更する
# ActionMailer::Base.smtp_settings = {
#     :user_name => 'your_sendgrid_username',
#     :password => 'your_sendgrid_password',
#     :domain => 'yourdomain.com',
#     :address => 'smtp.sendgrid.net',
#     :port => 587,
#     :authentication => :plain,
#     :enable_starttls_auto => true
#   }

# TODO: SMTPを準備したら :smtp に変更する
ActionMailer::Base.delivery_method = :sendmail