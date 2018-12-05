# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_current_user
  def index
    @reservation_time = ReservationTime.new
    @reservations = ReservationTime.all
    @today = Date.today
    @today = params[:date].to_date if params[:date]
  end
end
