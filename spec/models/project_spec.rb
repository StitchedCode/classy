require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { create(:project) }
  let(:public_project) { create(:public_project) }

  describe 'callbacks' do
    it 'creates default labels after project creation' do
      expect { create(:project) }.to change(ProjectLabel, :count).by(2)
    end
  end

  context 'associations' do
    it { is_expected.to have_and_belong_to_many(:users) }
    it { is_expected.to have_many(:project_labels) }
    it { is_expected.to have_many(:text_labels) }
    it { is_expected.to have_many(:texts) }
    it { is_expected.to validate_presence_of(:name) }

    describe '#users' do
      let(:user1) { create(:user, projects: [project]) }
      let(:user2) { create(:user) }

      it 'returns all users if the project is public' do
        expect(public_project.users).to match_array([user1, user2])
      end

      it "returns only the project's users if the project is private" do
        expect(project.users).to match_array([user1])
      end
    end
  end

  context 'scopes' do
    describe '.public_projects' do
      it 'returns only the public projects' do
        expect(described_class.public_projects).to eq [public_project]
      end
    end
  end
end
