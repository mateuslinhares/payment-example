class CreatePaymentHistories < ActiveRecord::Migration
  def self.up
    create_table :payment_histories do |t|
      t.references :order
      t.references :product
      t.references :user
      t.integer :admin_id
      t.string :status
      t.string :payment_type
      t.decimal :price, :precision => 8, :scale => 2
      t.datetime :processed_at
      t.datetime :paid_at

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_histories
  end
end
