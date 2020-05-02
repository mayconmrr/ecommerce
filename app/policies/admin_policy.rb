# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  def new?
    user.full_access?
  end

  def edit?
    user.full_access?
  end

  def destroy?
    user.full_access?
  end

  def permitted_attributes
    if user.full_access?
      %w[name email role password password_confirmation]
    else
      %w[name email password password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
      user.full_access? ? scope.all : scope.with_restricted_access
    end
  end
end
