# frozen_string_literal: true

class Project < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :texts, dependent: :destroy
end
