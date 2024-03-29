# frozen_string_literal: true
module Admin
  class UploadController < Admin::BaseController
    skip_after_action :verify_authorized

    def new
    end

    def create
      project = Project.create!(name: upload_params[:project_name])
      upload = Upload.create(project_name: upload_params[:project_name], body: File.read(upload_params[:file].tempfile))

      ::ProcessUploadJob.perform_later(upload.id)
      redirect_to rails_admin_path(project)
    rescue ActiveRecord::RecordInvalid => _e
      redirect_to admin_upload_path, alert: t('.unique_project_names')
    end

    def edit
    end

    def update
      project = Project.find(update_params[:project_id])
      upload = Upload.create(project_name: project.name, body: File.read(upload_params[:file].tempfile))

      ::ProcessUploadJob.perform_later(upload.id)
      redirect_to rails_admin_path(project)
    end

    protected

    def upload_params
      params.require(:upload).permit(:project_name, :file)
    end

    def update_params
      params.require(:upload).permit(:project_id, :file)
    end
  end
end
