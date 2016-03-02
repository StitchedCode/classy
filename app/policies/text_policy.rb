class TextPolicy < ApplicationPolicy
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
        Text.public_texts + Text.for(user)
      end
    end
  end

  def show?
    record.in?(scope)
  end

  def update?
    show?
  end
end
