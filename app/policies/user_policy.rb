# frozen_string_literal: true
class UserPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def destroy?
    record == user || admin?
  end
end
