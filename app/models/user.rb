class User < ApplicationRecord

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
   
  validate :add_error_sample
  
  has_secure_password

  def add_error_sample

    if password_confirmation.blank?
      errors[:base] << "確認用passwordを入力して下さい"
    end

  end
  
end
