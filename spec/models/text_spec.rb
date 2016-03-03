require 'rails_helper'

RSpec.describe Text, type: :model do
  let(:project1) { create(:project) }
  let(:text1) { create(:text, project: project1) }
  let(:user) { create(:user, projects: [project1]) }

  context 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:project_labels) }
    it { is_expected.to have_many(:text_labels) }
    it { is_expected.to have_many(:users) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end

  context 'scopes' do
    let(:project2) { create(:public_project) }
    let(:text2) { create(:text, project: project2) }

    describe '.for' do
      it 'returns the text for a given user' do
        expect(described_class.for(user)).to match_array([text1])
      end
    end

    describe '.public_texts' do
      it 'returns texts from public projects' do
        expect(described_class.public_texts).to match_array([text2])
      end
    end

    describe '.labelled' do
      let(:text_label) { create(:text_label) }
      let(:text3) { create(:text, text_labels: [text_label]) }

      it 'only returns texts that haven been labelled' do
        expect(described_class.labelled).to match_array([text3])
      end
    end
  end

  context 'instance methods' do
    subject { text1 }

    describe '#labelled?' do
      it 'returns true when a text has been labelled' do
        allow(text1).to receive(:text_labels).and_return([double('text_label')])
        expect(subject.labelled?).to be true
      end

      it 'returns false when a text has not been labelled' do
        expect(subject.labelled?).to be false
      end
    end
  end

  describe '#labelled_by?' do
    let(:text_label) { create(:text_label, user: user) }
    before { text1.text_labels = [text_label] }

    it 'returns true if the text has been labelled by a given user' do
      expect(text1.labelled_by?(user)).to be true
    end

    it 'returns false if the text has not been labelled by a given user' do
      expect(text1.labelled_by?(create(:user))).to be false
    end
  end

  describe 'label' do
    it 'returns the name of the label with the highest count' do
      allow(subject).to receive(:label_counts).and_return('good' => 1, 'better' => 2)
      expect(subject.label).to eq 'better'
    end
  end
end
