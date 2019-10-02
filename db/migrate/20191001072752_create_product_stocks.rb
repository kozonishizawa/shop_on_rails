class CreateProductStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :product_stocks do |t|

      t.references :product
      t.string  :color
      t.integer :size, limit: 1, default: 0, null: false
      t.integer :quantity, default: 0, null: false

      t.timestamps
    end
  end
end
