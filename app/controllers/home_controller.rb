# frozen_string_literal: true

class HomeController < ApplicationController
  # トップ画面
  def index
    @today = Date.today
    if params[:date]
      @today = params[:date].to_date
    end
  end
end
