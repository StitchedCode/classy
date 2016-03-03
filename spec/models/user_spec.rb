# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:admin) { build(:admin) }

  context 'associations' do
    it { is_expected.to have_many(:text_labels) }
    it { is_expected.to have_many(:texts) }
    it { is_expected.to have_and_belong_to_many(:projects) }

    context 'roles' do
      describe 'admin?' do
        it "is 'false' for users" do
          expect(user.admin?).to be false
        end

        it "is 'true' for admins" do
          expect(admin.admin?).to be true
        end
      end

      describe 'admin!' do
        it 'turns users into admins' do
          expect do
            user.admin!
          end.to change(user, :role).from('user').to('admin')
        end
      end
    end
  end
end

