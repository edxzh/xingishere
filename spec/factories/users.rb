FactoryGirl.define do
  factory :user do
    id                          1000
    username                    "testuser"
    sequence(:name)             { |n| "testuser_#{n}" }
    sequence(:email)            { |n| "test_#{n}@qq.com" }
    password                    "password"
    password_confirmation       "password"
    password_digest             "asdfawef"

    factory :admin do
      admin true
    end
  end
end
