# frozen_string_literal: true
class ProjectsController < ApplicationController
  def index
    @projects = policy_scope(Project)
  end

  def show
    @project = Project.includes(:texts).find(params[:id])
    authorize @project
  end
end
