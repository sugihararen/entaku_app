# frozen_string_literal: true
class ReservationTimesController < ApplicationController
  before_action :set_current_user
  def create
    @reservation_time = ReservationTime.new(reservation_time_params)
    start_time = Time.zone.parse("#{reservation_time_params['start_time(1i)']}-#{reservation_time_params['start_time(2i)']}-#{reservation_time_params['start_time(3i)']} #{reservation_time_params['start_time(4i)']}:#{reservation_time_params['start_time(5i)']}:00").to_s       
    if ReservationTime.find_by(reservation_date: reservation_time_params[:reservation_date],start_time: start_time)
      flash[:notice] = "指定した時間帯はすでに予約が入っています"
      redirect_to home_index_path
    elsif @reservation_time.update(user_id: session[:user_id])
      @reservation_time.save     
      flash[:notice] = "予約が完了しました"
      redirect_to home_index_path
    else
      @today = Date.today
      render home_index_path
    end
  end

  private
  def reservation_time_params
    params.require(:reservation_time).permit(:reservation_theme,
                                             :reservation_date,
                                             :start_time,
                                             :end_time
                                             )  
  end
end
