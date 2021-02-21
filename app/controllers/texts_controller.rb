# frozen_string_literal: true

class TextsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @texts = @project.texts.all
    @locales = %w[en pt]
  end
end
