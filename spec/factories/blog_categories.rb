# encoding : utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog_category, class: "BlogCategory" do
    name "个性签名"
  end

  factory :blog_category2, class: "BlogCategory" do
    name "技术博客"
  end
end
