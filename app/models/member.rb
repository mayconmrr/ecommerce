# frozen_string_literal: true

class Member < ApplicationRecord
  # RatyRate gem
  ratyrate_rater

  # Associations
  has_many :ads, dependent: :destroy
  has_one :profile_member, dependent: :destroy
  accepts_nested_attributes_for :profile_member

  # Validation
  validate :nested_attributes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nested_attributes
    return unless nested_attributes_blank?

    message = 'É necessário preencer os campos Primeiro e Segundo nome.'
    errors.add(:base, message)
  end

  def nested_attributes_blank?
    profile_member.first_name.blank? || profile_member.second_name.blank?
  end
end
