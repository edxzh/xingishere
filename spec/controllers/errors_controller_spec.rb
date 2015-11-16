require 'rails_helper'

describe ErrorsController do
  describe '#show' do
    subject { get :show, code: status_code }

    context 'when status code is 404' do
      let(:status_code) { 404 }

      it { should render_with_layout('static') }
      it { should render_template('404'.to_sym) }
    end

    context 'when status code is 500' do
      let(:status_code) { 500 }

      it { should render_with_layout('static') }
      it { should render_template('500'.to_sym) }
    end
  end
end
