# frozen_string_literal: true

class RatingCache < ApplicationRecord
  belongs_to :cacheable, polymorphic: true
end
