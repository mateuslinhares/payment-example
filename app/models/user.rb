class User < ActiveRecord::Base
  has_many :orders
  has_many :payment_histories
end
