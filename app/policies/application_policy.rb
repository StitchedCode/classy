# frozen_string_literal: true
# rails_admin always use ApplicationPolicy, so we are using BasePolicy as base class
class ApplicationPolicy < BasePolicy
  def dashboard?
    admin?
  end

  def index?
    admin?
  end

  def new?
    admin?
  end

  def export?
    admin?
  end

  def bulk_delete?
    admin?
  end

  def show?
    admin?
  end

  def edit?
    admin?
  end

  def delete?
    admin?
  end

  def show_in_app?
    admin?
  end

  def history?
    admin?
  end
end
