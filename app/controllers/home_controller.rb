# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_current_user
  def index
    @reservation_time = ReservationTime.new
    @today = Date.today
    @today = params[:date].to_date if params[:date]
  end

  def show 
    @reservation_time = ReservationTime.new
    @today = Date.today
    @reservation_show_day = params[:date].to_date
  end
end
