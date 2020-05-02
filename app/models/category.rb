# frozen_string_literal: true

class Category < ApplicationRecord
  # Gem Friendly Id
  include FriendlyId
  friendly_id :description, use: :slugged

  # Associations
  has_many :ads, dependent: :destroy

  # Validations
  validates :description, presence: true

  # Scopes
  scope :order_by_description, -> { order(:description) }
end
