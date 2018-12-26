# frozen_string_literal: true

FactoryBot.define do
  factory :reservationtime do
    reservation_theme    'sample'
    reservation_date    '2018-12-25'
    start_time          '2018-12-25 04:00:00' 
    end_time            '2018-12-25 05:00:00' 
    weekly              '0'
    user_id             '7'
  end
end
