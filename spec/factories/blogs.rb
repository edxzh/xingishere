FactoryGirl.define do
  factory :blog, class: 'Blog' do
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

  factory :unpublished_blog, class: 'Blog' do
    association               :user
    sequence(:title)          { |n| "未发布_#{n}" }
    sequence(:url_name)       { |n| "weifabu_#{n}" }
    content                   '未发布内容'
    seo_keyword               'blog'
    publish_status            false
    association               :blog_category, name: 'unpublished_category'
  end

  factory :blog2, class: 'Blog' do
    association         :user
    sequence(:title)    { |n| "rails文章_#{n}" }
    content             'rails内容'
    sequence(:url_name) { |n| "rails_content_#{n}" }
    seo_keyword         'blog'
    association         :blog_category, name: 'blog_category2'
    publish_status      true
  end

  factory :blog3, class: 'Blog' do
    association         :user
    sequence(:title)    { |n| "ruby文章_#{n}" }
    content             'ruby文章'
    sequence(:url_name) { |n| "ruby_content_#{n}" }
    seo_keyword         'blog'
    association         :blog_category, name: 'blog_category3'
    publish_status      true
  end
end
