# encoding: utf-8

FactoryGirl.define do
  factory :comment1, class: "Comment" do
    association       :user
    content           "日志留言1"
    association       :blog
  end
end
