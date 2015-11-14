# encoding: utf-8
require 'rails_helper'

describe BlogCategory do
  it { should have_many(:blogs) }

  it { should validate_uniqueness_of(:name).with_message('类别名已存在') }
  it { should validate_presence_of(:name).with_message('必须存在类别名') }
end
