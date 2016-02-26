class TextsController < ApplicationController
  def show
    @text = Text.find(params[:id])
  end

  def update
    text = Text.find(params[:id])
    text_label = TextLabel.find_or_create_by(text_id: text.id, user_id: current_user.id)
    text_label.update(project_label_id: params[:text][:classification])
    redirect_to project_path(text.project.id)
  end
end
