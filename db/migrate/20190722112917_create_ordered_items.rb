class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.references :product, foreign_key: true
      t.references :purchaser, foreign_key: true
      t.integer :quantity, default: 0
      t.integer :method
      t.boolean :paid, default: false
      t.boolean :shipped, default: false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
