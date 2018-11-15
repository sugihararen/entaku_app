class User < ApplicationRecord

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
   
  has_secure_password

  validate :add_error_sample

  def add_error_sample
    if password_confirmation.blank?
      errors[:base] << "確認用passwordを入力して下さい"
    end

  end
  
end
