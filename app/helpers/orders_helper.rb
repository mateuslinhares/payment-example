module OrdersHelper
  def paid_order(order)
    link_to 'Marcar como pago', order_path(order), :method => 'put' unless order.paid?
  end
end
