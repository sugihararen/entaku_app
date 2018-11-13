class HomeController < ApplicationController
  before_action :authenticate_user,{only:[:top]}

  #トップ画面
  def index

  end

end
