class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  has_many :payment_histories

  after_save :create_history

  UPDATE_USER = {
    "SYSTEM" => 0
  }

  def admin
    if self.admin_id == UPDATE_USER["SYSTEM"]
      UPDATE_USER["SYSTEM"]
    else
      User.find(self.admin_id)
    end
  end

  def paid?
    !!self.paid_at
  end

  def admin_name
    if self.admin == UPDATE_USER["SYSTEM"]
      UPDATE_USER.keys.to_s
    else
      self.admin.name
    end
  end

  private

  def create_history
    attributes = self.attributes
    attributes.delete(:id)
    attributes.merge! :order_id => self.id
    PaymentHistory.create attributes
  end
end
