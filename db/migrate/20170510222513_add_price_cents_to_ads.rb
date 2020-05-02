# frozen_string_literal: true

class AddPriceCentsToAds < ActiveRecord::Migration[6.0]
  def change
    add_column :ads, :price_cents, :integer, default: 0
  end
end
