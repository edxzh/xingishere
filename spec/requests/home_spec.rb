# encoding: utf-8
require 'spec_helper'

describe "首页" do
  before(:each) do
    visit root_path
  end

  subject { page }

  it { should have_content("有时过于聪明，有时过于愚蠢") }
  it { should have_content("Edward_mjz@hotmail.com") }
  it { should have_content("赞助") }
  it { should have_content("版权所有") }

end
