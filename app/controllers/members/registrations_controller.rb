# frozen_string_literal: true

module Members
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    def new
      build_resource({})
      resource.build_profile_member
      respond_with resource
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(
        :sign_up,
        keys:
          [
            :email, :password, :password_confirmation,
            profile_member_attributes: %i[first_name second_name]
          ]
      )
    end
  end
end
