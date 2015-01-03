# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_love, :class => 'UserLove' do
    association       :user
    association       :blog
  end
end
