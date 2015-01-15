# encoding : utf-8
FactoryGirl.define do
  factory :user, class: "User" do
    sequence(:id)               { |n| n }
    sequence(:username)         { |n| "username_#{n}" }
    sequence(:name)             { |n| "name_#{n}" }
    sequence(:email)            { |n| "test_e_#{n}@qq.com" }
    password                    "password"
    password_confirmation       "password"
    activate_code               SecureRandom.hex(4)
    activate_status             true
    admin                       false
    remember_token              SecureRandom.urlsafe_base64
    status                        0
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

    factory :unactivate_user do
      activate_status         false
    end
  end
end
