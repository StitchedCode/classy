# frozen_string_literal: true
FactoryGirl.define do
  factory :text do
    body { Faker::Lorem.paragraph }
  end
end
