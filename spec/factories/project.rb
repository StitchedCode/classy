# frozen_string_literal: true
FactoryGirl.define do
  factory :project do |p|
    sequence(:name) { |n| "Project #{n}" }
    public { false }

    factory :public_project do
      public { true }
    end
  end
end
