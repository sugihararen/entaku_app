# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_current_user
  # トップ画面
  def index
    @today = Date.today
    if params[:date]
      @today = params[:date].to_date
    end
  end
  #イベント作成
  def new
   # @reservation_time = Reservation_time.new(
   #                     user_id: session[:user_id],
   #                     reservation_date:,
   #                     start_time:,
   #                     end_time:
   #                     )
    render :index
  end
end
