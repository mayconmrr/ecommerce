class Admin < ApplicationRecord

  rolify
  # Constants
  # ROLES = {:full_access => 0, :restricted_access => 1}
  
  # Enums
  # enum role: ROLES

  # Scopes
  # scope :with_full_access, -> { where(role: ROLES[:full_access]) }
  scope :with_restricted_access, -> { with_role(Role.availables[1]) }
 


  scope :with_full_access, -> { where(role: :full_access) }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  def checked_roles
    self.roles.collect do |role|
      role.name
    end
  end
 
  def roles_descriptions
    self.roles.collect do |role|
      Role::OPTIONS[role.name.to_sym]
    end
  end

end
