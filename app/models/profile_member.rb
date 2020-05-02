# frozen_string_literal: true

class ProfileMember < ApplicationRecord
  belongs_to :member

  def full_name
    "#{first_name} #{second_name}"
  end
end
