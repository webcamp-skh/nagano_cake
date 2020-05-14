class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :payment_method
      t.integer :shipping, default: 800
      t.integer :billing_amount
      t.integer :order_status, default: 0
      t.string :ordered_postal_code
      t.string :ordered_address
      t.string :ordered_receiver_name

      t.timestamps
    end
  end
end
