# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Translation, type: :model do
  it { is_expected.to validate_presence_of(:locale) }
  it { is_expected.to belong_to(:text) }
end
