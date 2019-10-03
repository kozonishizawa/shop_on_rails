class ModifyCartItemTable < ActiveRecord::Migration[5.2]
  def change

    rename_column :cart_items, :product_id, :product_stock_id
    rename_column :ordered_items, :product_id, :product_stock_id

    #add_foreign_key :cart_items, :product_stocks, column: :product_stock_id
    #add_foreign_key :ordered_items, :product_stocks, column: :product_stock_id
  end
end
