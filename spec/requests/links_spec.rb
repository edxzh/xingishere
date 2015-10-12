# encoding: utf-8
require 'rails_helper'

RSpec.describe '友情链接页面', type: :feature do
  before(:each) do
    @link = FactoryGirl.create(:link)
    visit links_path
  end

  subject { page }

  it { should have_title '友情链接' }
  it { should have_selector('h1', text: '友情链接') }
  it { should have_link(@link.title, href: @link.href) }
  it { should have_content @link.category }
  it { should have_content '版权所有' }
end
