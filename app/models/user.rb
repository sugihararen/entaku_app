# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  validate :add_error_sample

  def add_error_sample
    errors[:base] << '確認用passwordを入力して下さい' if password_confirmation.blank?
  end
end
