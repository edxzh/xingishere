# encoding: utf-8
FactoryGirl.define do
  factory :blog, class: "Blog" do
    association               :user
    sequence(:title)          { |n| "我的日记_#{n}" }
    content                   "日记内容1"
    sequence(:url_name)       { |n| "woderiji_#{n}" }
    seo_keyword               "blog"
    association               :blog_category
    publish_status            true
    factory :top_blog do
      weight                  100
    end
  end

  factory :unpublished_blog, class: "Blog" do
    association       :user
    sequence(:title)          { |n| "未发布_#{n}" }
    sequence(:url_name)       { |n| "weifabu_#{n}" }
    content                   "未发布内容"
    seo_keyword               "blog"
    association               :blog_category, name: "unpublished_blog_blog_category"
    publish_status    false
  end

  factory :blog2, class: "Blog" do
    association       :user
    title             "rails文章"
    content           "rails内容"
    url_name          "railswenzhang"
    seo_keyword       "blog"
    association       :blog_category, name: "blog_category2"
    publish_status    true
  end

  factory :blog3, class: "Blog" do
    association       :user
    title             "ruby文章"
    content           "ruby文章"
    url_name          "rubywenzhang"
    seo_keyword       "blog"
    association       :blog_category, name: "blog_category3"
    publish_status    true
  end
end
