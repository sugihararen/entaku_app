# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user, only: [:top]
  # トップ画面
  def index
    @today = Date.today
    if params[:date]
      @today = (params[:date]).to_date
    end
  end

end
