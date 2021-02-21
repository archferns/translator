# frozen_string_literal: true

class Text < ApplicationRecord
  validates :key, presence: true
  belongs_to :project
  has_many :translations, dependent: :destroy

  accepts_nested_attributes_for :translations
end
