class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :organization
      t.string :email
      t.string :tel
      t.text :body
      t.integer :status, limit: 1, default: 0

      t.timestamps
    end
  end
end
