# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReservationTime, type: :model do
    it "is valid " do
        reservationtime = ReservationTime.new(
          reservation_date: "2018-12-20",
          reservation_theme: "sample",
          start_time: "2018-12-20 07:00:00", 
          end_time: "2018-12-20 08:00:00")
        expect(reservationtime).to be_valid
      end
end
