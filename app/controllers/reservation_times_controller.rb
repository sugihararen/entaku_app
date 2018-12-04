# frozen_string_literal: true
class ReservationTimesController < ApplicationController
  before_action :set_current_user
  def create
    @reservation_time = ReservationTime.new(reservation_time_params)
    @reservation_time.update(user_id: session[:user_id])
    if @reservation_time.save      
      flash[:notice] = "予約が完了しました"
      redirect_to home_index_path
    else
      @today = Date.today
      render home_index_path
    end
  end

  private
  def reservation_time_params
    params.require(:reservation_time).permit(:reservation_theme,:reservation_date,:start_time,:end_time)  
  end
end
