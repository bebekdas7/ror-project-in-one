class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chair, null: false, foreign_key: true
      t.string :full_name
      t.text :address
      t.string :city
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end
