class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :making_status, default: 0
      t.integer :item_count
      t.integer :ordered_price

      t.timestamps
    end
  end
end
