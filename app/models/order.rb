class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

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
end
