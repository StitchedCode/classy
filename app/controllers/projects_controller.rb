# frozen_string_literal: true
class ProjectsController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @projects = current_user.visible_projects
  end

  def show
    @project = Project.find(params[:id])
  end
end
