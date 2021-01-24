# frozen_string_literal: true

class Text < ApplicationRecord
  validates :key, presence: true
  belongs_to :project
end
