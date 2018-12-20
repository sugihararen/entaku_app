# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name                   'sugihararen'
    email                  'smple@dptr.jp'
    status                 '管理者'
    password               'ren19971121'
    password_confirmation  'ren19971121'
  end
end
