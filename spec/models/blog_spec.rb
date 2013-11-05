require File.dirname(__FILE__) + '/../spec_helper'

describe Blog do
  it "should be valid" do
    Blog.new.should be_valid
  end
end
