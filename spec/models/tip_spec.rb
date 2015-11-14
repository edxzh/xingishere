# encoding: utf-8
require 'rails_helper'

describe Tip do
  it { should validate_presence_of(:content) }
end
