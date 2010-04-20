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

  it 'should return a formatted date if has date' do
    date = Time.mktime('2010','01','01','12','00','00')
    helper.format_date(date).should == '01/01/2010 12:00:00'
  end

  it 'should return nil if has not date' do
    date = nil
    helper.format_date(date).should be_nil
  end
end
