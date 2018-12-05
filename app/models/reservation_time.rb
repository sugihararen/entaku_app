# frozen_string_literal: true

class ReservationTime < ApplicationRecord
  belongs_to :user
  validates :reservation_theme, presence: true
  validates :reservation_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
