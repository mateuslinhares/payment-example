require 'spec_helper'

describe User do
  should_have_many :orders
  should_have_many :payment_histories
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :email => "value for email"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
