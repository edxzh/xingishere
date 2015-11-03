FactoryGirl.define do
  factory :link, class: 'Link' do
    association         :link_category
    sequence(:id)       { |n| n }
    title               '链接1'
    href                'http://www.baidu.com'
  end
end
