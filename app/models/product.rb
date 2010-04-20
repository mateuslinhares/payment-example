class Product < ActiveRecord::Base
  has_many :orders
  has_many :payment_histories
  validates_presence_of :name, :description, :price
end
