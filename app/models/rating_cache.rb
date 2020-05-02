# frozen_string_literal: true

class RatingCache < ActiveRecord::Base
  belongs_to :cacheable, polymorphic: true
end
