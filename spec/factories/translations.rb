# frozen_string_literal: true

FactoryBot.define do
  factory :translation do
    text
    locale { 'en' }
    value { 'Hello world' }
  end
end
