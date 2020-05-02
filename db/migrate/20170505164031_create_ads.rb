# frozen_string_literal: true

class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :title, limit: 255
      t.text :description
      t.references :member, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
