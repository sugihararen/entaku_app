Devise.setup do |config|
  require 'devise/orm/active_record'
  config.omniauth :google_oauth2,
                  ENV['GOOGLE_APP_ID'], # 環境変数に先ほど控えたクライアントIDを入れておく
                  ENV['GOOGLE_APP_SECRET'], # 環境変数に先ほど控えたシークレットを入れておく
                  name: :google,
                  scope: %w(email) 
end