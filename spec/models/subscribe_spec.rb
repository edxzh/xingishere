# encoding: utf-8
require 'spec_helper'

describe Subscribe do
  before(:each) do
    @subscribe = FactoryGirl.create(:subscribe)
  end

  subject { @subscribe }

  describe "模型校验" do
    it "email不存在时" do
      @subscribe.email = ""
      expect(@subscribe).not_to be_valid
    end
    it "email重复时" do
      subscribe_with_same_email = @subscribe.dup
      expect(subscribe_with_same_email).not_to be_valid
    end
    it "email不符合规范时" do
      @subscribe.email = "fwefwef"
      expect(@subscribe).not_to be_valid
    end
  end
end
