# frozen_string_literal: true

class ReservationTimesController < ApplicationController
  before_action :set_current_user
  def create
    @reservation_time = ReservationTime.new(reservation_time_params)
    start_time = Time.zone.parse("#{reservation_time_params['start_time(1i)']}-#{reservation_time_params['start_time(2i)']}-#{reservation_time_params['start_time(3i)']} #{reservation_time_params['start_time(4i)']}:#{reservation_time_params['start_time(5i)']}:00")
    end_time = Time.zone.parse("#{reservation_time_params['end_time(1i)']}-#{reservation_time_params['end_time(2i)']}-#{reservation_time_params['end_time(3i)']} #{reservation_time_params['end_time(4i)']}:#{reservation_time_params['end_time(5i)']}:00")
    if ReservationTime.where(reservation_date: reservation_time_params[:reservation_date]) 
      reservations = ReservationTime.where(reservation_date: reservation_time_params[:reservation_date])
      reservations.each do |reservation|
        if start_time < reservation.end_time && end_time > reservation.start_time
          @message = '指定した時間帯はすでに予約が入っています'
          @today = Date.today
          @reservation_show_day =  Date.today
          return render(home_index_path)
        elsif start_time == end_time
          @message = '開始時刻と終了時刻が同じです'
          @today = Date.today
          @reservation_show_day =  Date.today
          return render(home_index_path)
        elsif start_time > end_time
          @message = '開始時刻が終了時刻より遅いです'
          @today = Date.today
          @reservation_show_day =  Date.today
          return render(home_index_path)
        end
      end
    end
    unless ReservationTime.where(reservation_date: reservation_time_params[:reservation_date])
      if start_time == end_time
        @message = '開始時刻と終了時刻が同じです'
        @today = Date.today
        @reservation_show_day =  Date.today
        return render(home_index_path)
      elsif start_time > end_time
        @message = '開始時刻が終了時刻より遅いです'
        @today = Date.today
        @reservation_show_day =  Date.today
        return render(home_index_path)
      end
    end
    if @reservation_time.update(user_id: session[:user_id])
      @reservation_time.save
      flash[:notice] = '予約が完了しました'
      redirect_to home_index_path
    else
      @today = Date.today
      @reservation_show_day =  Date.today
      render home_index_path
    end
  end

  def show    
    @reservation_show_day =  params[:date].to_date if params[:date]
    @reservation_start_time = params[:start_time].to_time if params[:start_time]
    @reservation_end_time = params[:end_time].to_time if params[:end_time]
    @reservation_theme = params[:reservation_thema] if params[:reservation_thema]
    @reservation_id = params[:reservation_id]
    @holiday_name = HolidayJapan.name(@reservation_show_day)
    @reservations = ReservationTime.all
    @users = User.all
  end

  def edit
    @reservation_show_day = params[:reservation_show_day] 
    @reservation_start_time = params[:reservation_start_time]
    @reservation_end_time = params[:reservation_end_time]
    @reservation_theme = params[:reservation_theme]
    @reservation_id = params[:reservation_id]
    @reservation_time = ReservationTime.find_by(reservation_date: @reservation_show_day, start_time: @reservation_start_time)
  end

  def update
    @reservation_time = ReservationTime.find_by(reservation_date:params[:reservation_time][:reservation_show_day],start_time:params[:reservation_time][:reservation_start_time])
    @reservation_id = params[:reservation_time][:reservation_id].to_i
    start_time = Time.zone.parse("#{reservation_time_params['start_time(1i)']}-#{reservation_time_params['start_time(2i)']}-#{reservation_time_params['start_time(3i)']} #{reservation_time_params['start_time(4i)']}:#{reservation_time_params['start_time(5i)']}:00")
    end_time = Time.zone.parse("#{reservation_time_params['end_time(1i)']}-#{reservation_time_params['end_time(2i)']}-#{reservation_time_params['end_time(3i)']} #{reservation_time_params['end_time(4i)']}:#{reservation_time_params['end_time(5i)']}:00")
    if ReservationTime.where(reservation_date: reservation_time_params[:reservation_date])
      reservations = ReservationTime.where(reservation_date: reservation_time_params[:reservation_date])
      reservations.each do |reservation|
        if @reservation_id != reservation.id 
          if start_time < reservation.end_time && end_time > reservation.start_time 
            flash.now[:notice] = '指定した時間帯はすでに予約が入っています'
            @reservation_start_time = params[:reservation_time][:reservation_start_time]
            @reservation_end_time = params[:reservation_time][:reservation_end_time]
            @reservation_theme = params[:reservation_time][:reservation_theme]
            @reservation_show_day = params[:reservation_time][:reservation_show_day]
            return render :edit
          end
        end
      end
    end
    if @reservation_time.update(reservation_time_params)
       @reservation_time.save
       flash[:notice] = '予約を編集しました'
       redirect_to home_index_path
    end
  end

  def destroy
    @reservation_time = ReservationTime.find_by(reservation_date:params[:reservation_show_day],start_time:params[:reservation_start_time])
    @reservation_time.destroy
    flash[:notice] = '予約を削除しました'
    redirect_to home_index_path
  end

  private

  def reservation_time_params
    params.require(:reservation_time).permit(:reservation_theme,:reservation_date,:start_time,:end_time)
  end
end
