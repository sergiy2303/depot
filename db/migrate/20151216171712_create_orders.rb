class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :phone
      t.string :address
      t.decimal :total, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
