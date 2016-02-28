require 'rails_helper'

describe UserLove do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:blog_id) }

  it { should belong_to(:user) }
  it { should belong_to(:blog) }

  describe '.add' do
    let!(:user_id) { FactoryGirl.create(:user).id }
    let!(:blog_id) { FactoryGirl.create(:blog).id }

    subject { UserLove.change_status(user_id, blog_id) }

    context 'when there exist user_love' do
      it 'should be deleted and return 0' do
        FactoryGirl.create(:user_love, user_id: user_id, blog_id: blog_id)
        expect { subject }.to change(UserLove, :count).by -1
        expect(subject).to eq 0
      end
    end

    context 'when there no user_love and return -1' do
      it 'should create a new user_love' do
        expect { subject }.to change(UserLove, :count).by 1
        expect(subject).to eq 1
      end
    end
  end
end
