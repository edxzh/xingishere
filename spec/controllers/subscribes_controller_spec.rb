# encoding: utf-8
require File.dirname(__FILE__) + '/../spec_helper'

describe SubscribesController do

  describe "create" do
    before(:each) do
      @subscribe = FactoryGirl.create(:subscribe)
    end

    it "create success" do
      post :create, email: "Edward_mjz@hotmail.com"
      expect(response.headers['Content-Type']).to have_content("application/json")
      expect(response.body).to eq({ "status" => 1, "message" => "subscribe success" }.to_json)
    end

    it "create fail" do
      post :create, email: "example@qq.com"
      expect(response.body).to eq({ "status" => -1, "message" => "you have subscribed" }.to_json)
    end

  end
end
