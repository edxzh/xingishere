# encoding: utf-8
require 'rails_helper'

describe Message do
  it { should validate_presence_of(:content) }
  it { should belong_to(:user) }
end
