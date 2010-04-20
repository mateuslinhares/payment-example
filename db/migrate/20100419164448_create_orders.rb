class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.references :product
      t.references :user
      t.integer :admin_id
      t.decimal :price, :precision => 8, :scale => 2
      t.string :payment_type
      t.string :status
      t.datetime :processed_at
      t.datetime :paid_at

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
