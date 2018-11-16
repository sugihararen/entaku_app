# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'sessions#create' do
    subject { post :create, params: { name: 'sugihararen', password: 'ren19971121' } }

    context '正常なログイン情報でログインした場合' do
      before do
        user = create(:user)
        allow(User).to receive(:find_by).and_return(user)
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
end
