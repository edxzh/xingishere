# encoding: utf-8
require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe HomeHelper do
  before(:each) do
    @blog = FactoryGirl.create(:top_blog)
  end
  it "weight_status" do
    expect(weight_status(@blog)).to eq "<span class='ding'>[顶]</span>"
  end
end
