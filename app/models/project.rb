# frozen_string_literal: true

class Project < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :texts, dependent: :destroy

  accepts_nested_attributes_for :texts
end
