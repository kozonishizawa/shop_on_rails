class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :comment
      t.integer :category
      t.string :color
      t.integer :size, default: 0
      t.integer :stock, default: 0

      t.timestamps
    end
  end
end
