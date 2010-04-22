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

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

  def history
    @payment_history = PaymentHistory.find_all_by_order_id(params[:id], :order => 'created_at DESC, id DESC')
  end
end
