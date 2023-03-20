class CreateOrderShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_shipping_addresses do |t|
      t.references :order, null: false, foreign_key: true
      t.references :shipping_address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
