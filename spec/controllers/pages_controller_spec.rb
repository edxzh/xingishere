require 'rails_helper'

describe PagesController do
  describe '#about' do
    subject { get :about }

    it { should_not render_with_layout }
    it { should render_template(:about) }
  end

  describe '#resume' do
    subject { get :resume }

    it { should render_with_layout(:static) }
    it { should render_template(:resume) }
  end

  describe 'xingge' do
    subject { get :xingge }

    it { should_not render_with_layout }
    it { should render_template(:xingge) }
  end

  describe '#api' do
    subject { get :api }

    it { should render_with_layout(:static) }
    it { should render_template(:api) }
  end
end
