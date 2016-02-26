# frozen_string_literal: true
module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin!

    private

    def authenticate_admin!
      return if current_user.admin?
      raise Pundit::NotAuthorizedError.new
    end
  end
end
