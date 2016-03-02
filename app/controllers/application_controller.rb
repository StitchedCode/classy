# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  after_action :verify_authorized, except: :index, unless: :whitelisted_controller?

  def after_sign_in_path_for(resource)
    resource.admin? ? rails_admin_path : root_path
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    # we are not using root_path cause of rails_admin namespacing
    redirect_to(request.referrer || '/')
  end
  
  def whitelisted_controller?
    devise_controller? || rails_admin_controller?
  end

  # This is a bit of a hack, but for whatever reason rails_admin removed this method
  def rails_admin_controller?
    self.class.name =~ /RailsAdmin/
  end
end
