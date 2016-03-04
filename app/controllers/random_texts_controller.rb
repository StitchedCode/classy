# frozen_string_literal: true
class RandomTextsController < ApplicationController
  skip_after_action :verify_authorized, only: [:show]

  def show
    @project = Project.find(params[:project_id])
    @text = @project.texts.random_unlabelled_for(current_user)
    authorize @text if @text
  end
end
