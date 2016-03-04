# frozen_string_literal: true
class TextsController < ApplicationController
  before_action :find_text_and_project

  # Currently not exposed through any route, we use RandomTextsController#index instead
  def show
  end

  def update
    text_label = TextLabel.find_or_create_by(text_id: @text.id, user_id: current_user.id)
    project_label = ProjectLabel.find_by(name: update_params[:classification])
    text_label.update(project_label_id: project_label.id)
    redirect_to project_path(@project.id)
  end

  private

  def find_text_and_project
    @project = Project.find(params[:project_id])
    @text = @project.texts.find(params[:id])
    authorize @text
  end

  def update_params
    params.require(:text).permit(:classification)
  end
end
