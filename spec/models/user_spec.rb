# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    subject { build(:user) }
    let(:locales) { I18n.available_locales.map(&:to_s) }
    it { should validate_presence_of(:email) }
  end
end
