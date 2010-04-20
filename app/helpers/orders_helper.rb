module OrdersHelper
  def paid_order(order)
    link_to 'Marcar como pago', order_path(order), :method => 'put' unless order.paid?
  end

  def format_date(date)
    date.strftime('%d/%m/%Y %H:%M:%S') unless date.nil?
  end
end
