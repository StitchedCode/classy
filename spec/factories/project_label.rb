# frozen_string_literal: true
FactoryGirl.define do
  factory :project_label do
    sequence(:name) { |n| "ProjectLabel #{n}" }
  end
end
