# frozen_string_literal: true
class ProjectPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        Project.public_projects + user.projects
      end
    end
  end

  def show?
    record.in?(scope)
  end
end
