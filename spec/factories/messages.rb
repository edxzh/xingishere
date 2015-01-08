# encoding: utf-8

FactoryGirl.define do
  factory :message, class:  "Message" do
    content         "留言"
    association     :user
  end

  factory :message_2, class:  "Message" do
    content         "留言2"
    association     :user
  end
end
