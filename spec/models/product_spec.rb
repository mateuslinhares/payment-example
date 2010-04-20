require 'spec_helper'

describe Product do
  should_have_many :orders
  should_have_many :payment_histories
  should_validate_presence_of :name, :description, :price

  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :price => 9.99,
      :active => true
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end

  it 'should be invalid without name' do
    product = Product.new(@valid_attributes.except(:name))
    product.should_not be_valid
  end

  it 'should be invalid without description' do
    product = Product.new(@valid_attributes.except(:description))
    product.should_not be_valid
  end

  it 'should be invalid without price' do
    product = Product.new(@valid_attributes.except(:price))
    product.should_not be_valid
  end
end
