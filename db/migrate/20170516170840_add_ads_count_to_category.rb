# frozen_string_literal: true

class AddAdsCountToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :ads_count, :integer, default: 0
  end
end
