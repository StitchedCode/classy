require 'rails_helper'

RSpec.describe TextLabel, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:text) }
    it { is_expected.to belong_to(:project_label) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:project) }
  end

  context 'delegation' do
    it 'delegates the "name" method to the project label' do
      project_label = build(:project_label)
      text_label = build(:text_label, project_label: project_label)

      expect(text_label.name).to eq project_label.name
    end
  end
end
