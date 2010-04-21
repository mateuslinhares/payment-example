require 'spec_helper'

describe Order do
  should_belong_to :product, :user
  should_have_many :payment_histories
  before(:each) do
    @valid_attributes = {
      :product_id => 1,
      :user_id => 1,
      :admin_id => 1,
      :price => 9.99,
      :payment_type => "value for payment_type",
      :status => "value for status",
      :processed_at => Time.now,
      :paid_at => Time.now,
      :transaction_token => 'ABCDEFGHIJKLMNOPQRSTUVXZ'
    }
  end

  it "should create a new instance given valid attributes" do
    Order.create!(@valid_attributes)
  end

  it 'should return system id if last update has made by app' do
    order = Order.new(@valid_attributes.except(:admin_id))
    order.admin_id = Order::UPDATE_USER["SYSTEM"]
    order.save
    order.admin.should == 0
  end

  it 'should return user has made last order update' do
    user = User.create(:name => 'teste', :email => 'teste@teste.com')
    order = Order.new(@valid_attributes.except(:admin_id))
    order.admin_id = user.id
    order.admin.should == user
  end

  it 'should return true if product paid' do
    order = Order.create(@valid_attributes)
    order.should be_paid
  end

  it 'should return false if product not paid' do
    order = Order.create(@valid_attributes.except(:paid_at))
    order.should_not be_paid
  end

  it 'should return SYSTEM as admin user name' do
    order = Order.new(@valid_attributes.except(:admin_id))
    order.admin_id = Order::UPDATE_USER["SYSTEM"]
    order.save
    order.admin_name.should == 'SYSTEM'
  end

  it 'should return admin user name' do
    user = User.create(:name => 'Admin user', :email => 'teste@teste.com')
    order = Order.new(@valid_attributes.except(:admin_id))
    order.admin_id = user.id
    order.admin_name.should == 'Admin user'
  end
end
