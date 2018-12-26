# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name and email and status and password and password_confirmation' do
    user = User.new(name: 'sugihararen',email: 'smple@dptr.jp',status: '管理者',password: 'ren19971121',password_confirmation: 'ren19971121')
    expect(user).to be_valid
  end

  it 'is invalid without name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors.messages[:name]).to include("を入力してください")
  end

  it 'is invalid without email' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors.messages[:email]).to include("を入力してください")
  end

  it 'is invalid without password' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors.messages[:password]).to include("を入力してください")
  end

end
