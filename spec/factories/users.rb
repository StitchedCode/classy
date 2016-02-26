# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    email
    password { 'passw0rd' }
  end
end
