# encoding: utf-8
require 'spec_helper'

describe "首页" do
  before(:each) do
    visit root_path
  end

  subject { page }

  it { should have_content("Sometimes over smart, sometimes over silly") }
  it { should have_content("xing") }
  it { should have_content("donate") }
end
