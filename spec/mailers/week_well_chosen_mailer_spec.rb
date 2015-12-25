require 'rails_helper'

describe WeekWellChosenMailer do
  describe '#deliver_week_blogs' do
    let(:email) { 'fake@email.com' }

    subject { WeekWellChosenMailer.deliver_week_blogs(email) }

    it { should deliver_to(email) }
    it { should deliver_from('postmaster@xingishere.com') }
    it { should have_subject('starzhou每周精选') }
  end
end
