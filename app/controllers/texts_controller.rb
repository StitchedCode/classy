class TextsController < ApplicationController
  before_action :find_text_and_project

  def show
    authorize @text
  end

  def update
    authorize @text
    text_label = TextLabel.find_or_create_by(text_id: @text.id, user_id: current_user.id)
    text_label.update(project_label_id: update_params[:classification])
    redirect_to project_path(@project.id)
  end

  private

  def find_text_and_project
    @project = Project.find(params[:project_id])
    @text = @project.texts.find(params[:id])
  end

  def update_params
    params.require(:text).permit(:classification)
  end
end
