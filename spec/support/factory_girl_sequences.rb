# frozen_string_literal: true
FactoryGirl.define do
  sequence :email do |n|
    "#{n}#{Faker::Internet.email}"
  end
end
