# frozen_string_literal: true

class Googleuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :trackable, :omniauthable, omniauth_providers: %i[google]
  #protected

  def self.find_for_google(auth)
    user = Googleuser.find_by(email: auth.info.email)

    user ||= Googleuser.create(name: auth.info.name,
                               provider: auth.provider,
                               uid: auth.uid,
                               token: auth.credentials.token,
                               password: Devise.friendly_token[0, 20],
                               meta: auth.to_yaml)
    user
  end
end
