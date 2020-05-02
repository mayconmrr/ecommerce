# frozen_string_literal: true

class CreateRatingCaches < ActiveRecord::Migration[6.0]
  def self.up
    create_table :rating_caches do |t|
      t.belongs_to :cacheable, polymorphic: true
      t.float :avg, null: false
      t.integer :qty, null: false
      t.string :dimension
      t.timestamps
    end

    add_index :rating_caches, %i[cacheable_id cacheable_type]
  end

  def self.down
    drop_table :rating_caches
  end
end
