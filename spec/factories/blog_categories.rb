# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog_category do
    name "MyString"
    blog_id 1
  end
end
