class OrdersController < ApplicationController
  layout 'spyke'
  def index
    @orders = Order.all
  end

  def update
    admin_user = User.last
    order = Order.find(params[:id])
    order.admin_id = admin_user.id
    order.status = PagSeguro::Notification::STATUS.index(:completed)
    order.paid_at = Time.now unless order.paid?
    if order.save
      redirect_to orders_path
    else
      flash[:error] = 'Erro'
      render :index
    end
  end
end
