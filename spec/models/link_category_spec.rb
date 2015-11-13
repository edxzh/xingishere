require 'rails_helper'

describe LinkCategory do
  it { should have_many(:links) }
  it { should belong_to(:user) }
end
