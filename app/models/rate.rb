# frozen_string_literal: true

class Rate < ApplicationRecord
  belongs_to :rater, class_name: 'Member'
  belongs_to :rateable, polymorphic: true
end
