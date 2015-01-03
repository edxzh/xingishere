# encoding: utf-8
require 'spec_helper'

describe Link do
  before(:each) do
    @link = FactoryGirl.create(:link)
  end
  subject { @link }

  describe "模型校验" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:href) }
    it { should validate_presence_of(:link_category_id) }
    it "title 超过20" do
      @link.title = "x" * 21
      expect(@link).not_to be_valid
    end
    it "title 小于 1" do
      @link.title = ""
      expect(@link).not_to be_valid
    end
  end
end
