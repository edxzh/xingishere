# encoding: utf-8
require 'spec_helper'

describe Tip do
  before(:each) do
    @tip = FactoryGirl.create(:tip)
  end
  subject { @tip }

  describe "模型校验" do
    it { should validate_presence_of(:content) }
  end
end
