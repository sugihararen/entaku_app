# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
     @user = FactoryBot.create(:user)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end
  
  it 'is valid with name and email and password and password_confirmation' do
    user = User.new(name: 'sample',email: 'sample@dptr.jp',password: 'sample',password_confirmation: 'sample')
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

  it "is same name" do
    user = User.new(name: 'sugihararen')
    user.valid?
    expect(user.errors[:name]).to include("はすでに存在します")
  end

  it "is same email" do
    user = User.new(email: 'sugihara@dptr.jp')
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

end
