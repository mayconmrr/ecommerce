# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :ad
end
