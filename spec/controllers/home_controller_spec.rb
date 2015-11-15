require 'rails_helper'

describe HomeController do
  describe '#index' do
    subject { get :index }

    before do
      FactoryGirl.create_list(:blog, 11, blog_category_id: 1)
    end

    it { should render_with_layout('home') }

    it 'should assign @blogs' do
      subject
      expect(assigns(:blogs).count).to eq 10
    end

    context 'when existed high weight blog' do
      before do
        FactoryGirl.create(:top_blog)
      end

      it 'high weight blog should show first' do
        subject
        assigns(:blogs).first.weight { is_expected.to be > assigns(:list_price_sets).last.weight }
      end
    end

    it 'should show 10 blogs per page' do
      get :index, page: 2
      expect(assigns(:blogs).count).to eq 1
    end

    it 'should render index page' do
      subject
      expect(response).to render_template(:index)
    end
  end
end
