# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[6.0]
  def self.up
    create_table :rates do |t|
      t.belongs_to :rater
      t.belongs_to :rateable, polymorphic: true
      t.float :stars, null: false
      t.string :dimension
      t.timestamps
    end

    # add_index :rates, :rater_id
    # add_index :rates, %i[rateable_id rateable_type]
  end

  def self.down
    drop_table :rates
  end
end
