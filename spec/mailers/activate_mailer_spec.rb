require 'rails_helper'

describe ActivateMailer do
  describe '#user_activate' do
    let(:user) { FactoryGirl.create(:user) }

    subject { ActivateMailer.user_activate(user) }

    it { should deliver_to(user.email) }
    it { should deliver_from('starzhou.com') }
    it { should have_subject('帐号激活') }
  end
end
