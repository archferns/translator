# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'texts/index', type: :view do
  let(:project) { FactoryBot.create(:project) }

  let(:text) { FactoryBot.create(:text, key: 'key_1', project: project) }

  before do
    assign(:project, project)
    assign(:texts, [text])
    assign(:locales, ['en'])
  end

  it 'renders a list of texts' do
    render
    assert_select '.grid>div', text: 'key_1', count: 1
  end
end
