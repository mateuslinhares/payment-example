require 'spec_helper'

describe PaymentHistory do
  should_belong_to :order, :product, :user
  before(:each) do
    @valid_attributes = {
      :order_id => 1,
      :product_id => 1,
      :user_id => 1,
      :status => "value for status",
      :payment_type => "value for payment_type",
      :price => 9.99,
      :processed_at => Time.now,
      :paid_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    PaymentHistory.create!(@valid_attributes)
  end
end
