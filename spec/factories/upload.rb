# frozen_string_literal: true
FactoryGirl.define do
  factory :upload do
    sequence(:project_name) { |n| "Upload #{n}" }
    body { [ { text: 'Foo', context: 'Bar' }] }
  end
end
