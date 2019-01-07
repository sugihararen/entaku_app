# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReservationTime, type: :model do
  it 'is valid with reservation_thema and reservation_date and start_time and end_time ' do
    reservationtime = ReservationTime.new(reservation_theme: 'sample',
                                          reservation_date: '2018-12-20',
                                          start_time: '2018-12-20 07:00:00',
                                          end_time: '2018-12-20 08:00:00')
    expect(reservationtime).to be_valid
  end

  it 'is invalid without reservation_thema' do
    reservationtime = ReservationTime.new(reservation_theme: nil)
    reservationtime.valid?
    expect(reservationtime.errors.messages[:reservation_theme]).to include("を入力してください")
  end

  it 'is invalid without reservation_date' do
    reservationtime = ReservationTime.new(reservation_date: nil)
    reservationtime.valid?
    expect(reservationtime.errors.messages[:reservation_date]).to include("を入力してください")
  end

  it 'is invalid without start_time' do
    reservationtime = ReservationTime.new(start_time: nil)
    reservationtime.valid?
    expect(reservationtime.errors.messages[:start_time]).to include("を入力してください")
  end

  it 'is invalid without end_time' do
    reservationtime = ReservationTime.new(end_time: nil)
    reservationtime.valid?
    expect(reservationtime.errors.messages[:end_time]).to include("を入力してください")
  end

end
