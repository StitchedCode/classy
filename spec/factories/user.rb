# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'passw0rd' }

    factory :admin do
      email { 'superman@stitched.io' }
      role 'admin'
    end
  end
end
