class ModifyCartItemTable < ActiveRecord::Migration[5.2]
  def change

    remove_column :cart_items, :product_id
    remove_column :ordered_items, :product_id

    add_column :cart_items, :product_stock_id, :bigint, null: false, index: true
    add_column :ordered_items, :product_stock_id, :bigint, null: false, index: true
  end
end
