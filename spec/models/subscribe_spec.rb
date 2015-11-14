# encoding: utf-8
require 'rails_helper'

describe Subscribe do
  it { should validate_presence_of(:email).with_message('please input email') }
  it { should validate_uniqueness_of(:email).with_message('you have subscribed') }
end
