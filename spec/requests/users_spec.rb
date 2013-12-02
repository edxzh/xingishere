# encoding : utf-8
require 'spec_helper'

describe "Users" do
  describe "GET /users/new" do
    it "user should visit register page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/users/new'
      expect(page).to have_content('注册')
    end
  end
end
