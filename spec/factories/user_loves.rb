FactoryGirl.define do
  factory :user_love, class: 'UserLove' do
    association       :user
    association       :blog
  end
end
