# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'sessions#create' do
    subject { post :create, params: { user: { name: 'sugihararen', password: 'ren19971121' } } }

    context '正常なログイン情報でログインした場合' do
      before do
        create(:user)
      end

      it 'TOP画面へ遷移されること' do
        expect(subject).to redirect_to home_index_url
      end
    end

    context '異常なログイン情報でログインした場合' do
      it 'ログイン画面へ遷移' do
        expect(subject).to render_template :new
      end
    end
  end

  describe 'sesions#destroy' do
    context 'ログアウト'
    it 'ログイン画面へ遷移' do
      session = { 'user_id' => 'nil' }
      add_session(session)
      expect(delete(:destroy)).to redirect_to login_url
    end
  end
end
