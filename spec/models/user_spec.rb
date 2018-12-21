# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
    it "is valid " do
        user = User.new(
            name:'sugihararen',
            email:'smple@dptr.jp',
            status:'管理者',
            password:'ren19971121',
            password_confirmation:'ren19971121')
        expect(user).to be_valid
      end
end
