# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # after_action :verify_authorized, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    resource.admin? ? rails_admin_path : root_path
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
