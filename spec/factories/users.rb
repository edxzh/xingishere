# encoding : utf-8
FactoryGirl.define do
  factory :user do
    sequence(:id)               { |n| n }
    username                    "testuser"
    sequence(:name)             { |n| "testuser_#{n}" }
    sequence(:email)            { |n| "test_e_#{n}@qq.com" }
    password                    "password"
    password_confirmation       "password"
    password_digest             "asdfawef"

    factory :admin do
      admin true
    end
  end
  factory :blog do
    title           "我的日记"
    content         "日记内容1"
    user
  end
end
