class Member < ApplicationRecord

  # RatyRate gem
  ratyrate_rater

  # Associations
  has_many :ads
  has_one :profile_member
  accepts_nested_attributes_for :profile_member

  # Validation
  validate :nested_attributes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nested_attributes
    errors.add(:base, 'É necessário preencer os campos Primeiros e Segundo nome.') if nested_attributes_blank?
  end

  def nested_attributes_blank?
    profile_member.first_name.blank? || profile_member.second_name.blank?
  end
end
