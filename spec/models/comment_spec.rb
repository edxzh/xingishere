# encoding: utf-8
require 'rails_helper'

describe Comment do
  before(:each) do
    @comment = FactoryGirl.create(:comment1)
  end

  subject { @comment }

  describe "模型校验" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:blog_id) }
  end
end
