# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/texts', type: :request do
  let(:user) { FactoryBot.create(:confirmed_user) }
  let(:project) { FactoryBot.create(:project, user: user) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get project_texts_url(project)
      expect(response).to be_successful
    end
  end
end
