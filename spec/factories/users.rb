FactoryGirl.define do
  factory :user do
    username                    "testuser"
    name                        "testuser"
    email                       "test@qq.com"
    password                    "password"
    password_confirmation       "password"
    password_digest             "asdfawef"
  end
end
