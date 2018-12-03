# frozen_string_literal: true
class HomeController < ApplicationController
  before_action :set_current_user
  def index
    @reservations = ReservationTime.all
    @today = Date.today
    if params[:date]
      @today = params[:date].to_date
    end
  end
end
