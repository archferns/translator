# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/projects', type: :request do
  let(:valid_attributes) { { name: 'New Project' } }
  let(:invalid_attributes) { { name: ' ' } }
  let(:user) { FactoryBot.create(:confirmed_user) }
  let(:project) { FactoryBot.create(:project, user: user) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get projects_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get project_url(project)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_project_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      get edit_project_url(project)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Project' do
        expect do
          post projects_url, params: { project: valid_attributes }
        end.to change(Project, :count).by(1)
      end

      it 'redirects to the created project' do
        post projects_url, params: { project: valid_attributes }
        expect(response).to redirect_to(project_url(Project.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Project' do
        expect do
          post projects_url, params: { project: invalid_attributes }
        end.to change(Project, :count).by(0)
      end

      it 'returns an unprocessable_entity status' do
        post projects_url, params: { project: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'Updated name' } }

      it 'updates the requested project' do
        patch project_url(project), params: { project: new_attributes }
        expect(project.reload.name).to eq('Updated name')
      end

      it 'redirects to the project' do
        patch project_url(project), params: { project: new_attributes }
        project.reload
        expect(response).to redirect_to(project_url(project))
      end
    end

    context 'with invalid parameters' do
      it 'returns an unprocessable_entity status' do
        patch project_url(project), params: { project: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested project' do
      project.save!
      expect do
        delete project_url(project)
      end.to change(Project, :count).by(-1)
    end

    it 'redirects to the projects list' do
      delete project_url(project)
      expect(response).to redirect_to(projects_url)
    end
  end
end
