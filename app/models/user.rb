# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true,uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  has_many :reservation_times
end
