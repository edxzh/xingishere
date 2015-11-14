FactoryGirl.define do
  factory :blog_category, class: "BlogCategory" do
    sequence(:name) { |n| "个性签名_#{n}" }
  end

  factory :blog_category2, class: "BlogCategory" do
    sequence(:name) { |n| "技术博客" }
  end

  factory :blog_category3, class: "BlogCategory" do
    sequence(:name) { |n| "美丽世界" }
  end
end
