# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/index', type: :view do
  before do
    assign(:projects, FactoryBot.create_list(:project, 2, name: 'Name'))
  end

  it 'renders a list of projects' do
    render
    assert_select '.flex .text-2xl', text: 'Name'.to_s, count: 2
  end
end
