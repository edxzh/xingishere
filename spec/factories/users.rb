# encoding : utf-8
FactoryGirl.define do
  factory :user, class: "User" do
    sequence(:id)               { |n| n }
    username                    "testuser"
    sequence(:name)             { |n| "testuser_#{n}" }
    sequence(:email)            { |n| "test_e_#{n}@qq.com" }
    password                    "password"
    password_confirmation       "password"
    password_digest             "asdfawef"
    factory :profile_user do
      status                      1
      relation                    1
      factory :advanced_user do
        address                 "成都市XX村"
      end
    end

    factory :admin do
      admin true
    end
  end
end
