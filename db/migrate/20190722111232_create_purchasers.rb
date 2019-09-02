class CreatePurchasers < ActiveRecord::Migration[5.2]
  def change
    create_table :purchasers do |t|
      t.references :user, foreign_key: true
      t.string :kana
      t.string :last_name
      t.string :first_name
      t.integer :postal_code
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
