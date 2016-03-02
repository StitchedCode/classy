# rails_admin always falls back to ApplicationPolicy, so we are using BasePolicy as superclass for our policy classes.
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