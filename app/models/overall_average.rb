# frozen_string_literal: true

class OverallAverage < ApplicationRecord
  belongs_to :rateable, polymorphic: true
end
