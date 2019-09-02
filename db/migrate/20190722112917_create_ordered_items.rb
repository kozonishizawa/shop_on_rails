class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.references :product, foreign_key: true
      t.references :purchaser, foreign_key: true
      t.integer :quantity, default: 0
      t.string  :method
      t.timestamps
    end
  end
end
