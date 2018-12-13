# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user
  
  
  
  def index
    @reservation_time = ReservationTime.new
    @reservation_show_day =  Date.today
    @today = Date.today
    @today = params[:date].to_date  if params[:date] 
  end

  def show 
    @reservation_time = ReservationTime.new
    @today = params[:date].to_date if params[:date]
    @reservation_show_day = params[:date].to_date if params[:date]
    render :index
  end

end
