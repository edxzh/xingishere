require 'rails_helper'

RSpec.describe HomeHelper do
  before(:each) do
    @blog = FactoryGirl.create(:top_blog)
  end

  it 'weight_status' do
    expect(weight_status(@blog)).to eq "<span class='ding'>[顶]</span>"
  end
end
