# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Text, type: :model do
  it { is_expected.to validate_presence_of(:key) }
  it { is_expected.to belong_to(:project) }
  it { is_expected.to have_many(:translations) }
end
