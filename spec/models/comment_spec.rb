# encoding: utf-8
require 'rails_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:blog) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:blog_id) }
  it { should validate_presence_of(:nickname) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:content) }

  it { should validate_length_of(:nickname).is_at_least(1).is_at_most(8) }
  it { should validate_length_of(:content).is_at_least(1).is_at_most(160) }
end
