# encoding: utf-8
FactoryGirl.define do
  # association :user
  factory :blog, class: "Blog" do
    title             "我的日记"
    content           "日记内容1"
    publish_status    true
  end

  factory :unpublished_blog, class: "Blog" do
    title             "未发布"
    content           "未发布内容"
    publish_status    false
  end

  factory :blog2, class: "Blog" do
    title             "rails文章"
    content           "rails内容"
    publish_status    true
  end

  factory :blog3, class: "Blog" do
    title             "ruby文章"
    content           "ruby文章"
    publish_status    true
  end
end
