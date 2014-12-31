# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscribe, class: "Subscribe" do
    email "example@qq.com"
  end
end
