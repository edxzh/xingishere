# encoding: utf-8
FactoryGirl.define do
  # association :user
  factory :blog, class: "Blog" do
    title             "我的日记"
    content           "日记内容1"
    url_name          "woderiji"
    seo_keyword       "blog"
    publish_status    true
  end

  factory :unpublished_blog, class: "Blog" do
    title             "未发布"
    url_name          "weifabu"
    content           "未发布内容"
    seo_keyword       "blog"
    publish_status    false
  end

  factory :blog2, class: "Blog" do
    title             "rails文章"
    content           "rails内容"
    url_name          "railswenzhang"
    seo_keyword       "blog"
    publish_status    true
  end

  factory :blog3, class: "Blog" do
    title             "ruby文章"
    content           "ruby文章"
    url_name          "rubywenzhang"
    seo_keyword       "blog"
    publish_status    true
  end
end
