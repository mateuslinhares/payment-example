require 'spec_helper'

describe OrdersHelper do
  it 'should return a link if order not paid' do
    order = Order.create(
      :product_id => 1,
      :user_id => 1,
      :admin_id => 1,
      :price => 9.99,
      :payment_type => "value for payment_type",
      :status => "value for status",
      :processed_at => Time.now,
      :paid_at => nil
    )
    helper.paid_order(order).should == link_to('Marcar como pago',order_path(order), :method => 'put')
  end

  it 'should return nil if order not paid' do
    order = Order.create(
      :product_id => 1,
      :user_id => 1,
      :admin_id => 1,
      :price => 9.99,
      :payment_type => "value for payment_type",
      :status => "value for status",
      :processed_at => Time.now,
      :paid_at => Time.now
    )
    helper.paid_order(order).should be_nil
  end
end
