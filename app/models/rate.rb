# frozen_string_literal: true

class Rate < ActiveRecord::Base
  belongs_to :rater, class_name: "Member"
  belongs_to :rateable, polymorphic: true
end
