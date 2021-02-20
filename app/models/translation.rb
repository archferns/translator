# frozen_string_literal: true

class Translation < ApplicationRecord
  belongs_to :text
  validates :locale, presence: true
end
