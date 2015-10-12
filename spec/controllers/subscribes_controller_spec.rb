# encoding: utf-8
require 'rails_helper'

RSpec.describe SubscribesController, type: :controller do
  describe 'create' do
    before(:each) do
      @subscribe = FactoryGirl.create(:subscribe)
    end

    it 'create success' do
      post :create, email: 'Edward_mjz@hotmail.com'
      expect(response.headers['Content-Type']).to have_content('application/json')
      expect(JSON.parse(response.body)).to eq('status' => 1, 'message' => 'subscribe success')
    end

    it 'create fail' do
      post :create, email: 'example@qq.com'
      expect(JSON.parse(response.body)).to eq('status' => -1, 'message' => 'you have subscribed')
    end
  end
end
