# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'password' }
    factory :confirmed_user do
      confirmed_at { Time.zone.now }
    end
  end
end
