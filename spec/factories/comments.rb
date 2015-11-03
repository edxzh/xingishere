FactoryGirl.define do
  factory :comment1, class: "Comment" do
    association       :user
    content           '日志留言1'
    association       :blog
    nickname          'nickname'
    email             'email'
  end
end
