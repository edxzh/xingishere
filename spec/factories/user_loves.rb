# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_lofe, :class => 'UserLove' do
    user_id 1
    blog_id 1
  end
end
