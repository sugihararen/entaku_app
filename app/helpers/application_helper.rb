# frozen_string_literal: true

module ApplicationHelper
  def sign_in?
    !session[:user_id].nil?
  end
end
