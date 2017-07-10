class AdminPolicy < ApplicationPolicy
  
  def new?
    #user.full_access?
    user.has_role? Role.availables[0]
  end

  def edit?
    user.has_role? Role.availables[0]
  end

  def destroy?
    user.has_role? Role.availables[0]
  end

  def permitted_attributes
    if user.has_role? Role.availables[0] 
      [:name, :email, :role, :password, :password_confirmation]
    else
      [:name, :email, :password, :password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
      if user.has_role? Role.availables[0] 
    		scope.all
    	else
    		scope.with_restricted_access
      end
    end
  end
end
