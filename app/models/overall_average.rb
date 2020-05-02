# frozen_string_literal: true

class OverallAverage < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
end
