# frozen_string_literal: true
class ReservationTimesController < ApplicationController
  before_action :set_current_user
  def create
    # @reservation_time = set_current_user.reservation_times.new(reservation_time_params)
    #@reservation_time = ReservationTime.new(reservation_time_params)
     @reservation_time = ReservationTime.new(
       user_id: session[:user_id],
       reservation_theme: params[:reservation_theme],
       reservation_date: params[:reservation_date],
       start_time: params[:start_time],
       end_time: params[:end_time]
       )
       if @reservation_time.save
        flash[:notice] = "予約が完了しました"
        redirect_to home_index_path
      end
    # def reservation_time_params
    #    params.require(:reservation_time).permit(
    #    :start_time,
    #    :end_time,
    #    :reservation_date
    #  )
    # end
    # def reservation_time_params
    #   params.require(:reservation_time).permit(:reservation_theme,:eservation_date,:start_time,:end_time)  
    # end
  end
end
