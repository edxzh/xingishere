require 'rails_helper'

RSpec.describe HomeHelper do
  let(:top_blog) { FactoryGirl.create(:top_blog) }

  describe '.weight_status' do
    it 'should return correct html with 顶' do
      expect(weight_status(top_blog)).to eq "<span class='ding'>[顶]</span>"
    end
  end

  describe '.display_content' do
    let(:random_string) { SecureRandom.hex(150) }

    it 'should return first 240 with ......' do
      expect(display_content(random_string)).to eq random_string[0...240] + '......'
    end
  end
end
