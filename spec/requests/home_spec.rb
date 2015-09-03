# encoding: utf-8
require 'rails_helper'

RSpec.describe '首页', type: :feature do
  before(:each) do
    visit root_path
  end

  subject { page }

  it { should have_content('Sometimes over smart, sometimes over silly') }
  it { should have_content('Edward_mjz@hotmail.com') }
  it { should have_content('xing') }
  it { should have_content('donation') }
end
