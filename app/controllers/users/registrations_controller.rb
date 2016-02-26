# frozen_string_literal: true
module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    protected

    def update_resource(resource, params)
      if params[:password].present?
        resource.update_with_password(params)
      else
        resource.update_without_password(params)
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update)
    end
  end
end
