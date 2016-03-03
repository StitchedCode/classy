require 'rails_helper'

RSpec.describe ProjectLabel, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:text_labels) }
    it { is_expected.to have_many(:texts) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
