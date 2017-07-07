class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :ad, foreign_key: true
      t.integer :status, default: 0
      t.references :buyer, foreign_key: true

      t.timestamps
    end
  end
end
