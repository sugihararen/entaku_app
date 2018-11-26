# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user, only: [:top]
  # トップ画面
  def index
    @today = Date.today
  end

  def next_month
    @today = (params[:date]).to_date
    @today = @today.next_month
    render "index"
  end

  def last_month
    @today = (params[:date]).to_date
    @today = @today.last_month
    render "index"
  end


end
