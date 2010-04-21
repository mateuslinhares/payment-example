class ShopController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def checkout
    current_user = User.first
    @product = Product.find(params[:id])
    ikwa_order = Order.create :user => current_user,
                              :product => @product,
                              :admin_id => Order::UPDATE_USER["SYSTEM"],
                              :status => 'Compra Iniciada',
                              :price => @product.price
    @order = PagSeguro::Order.new(ikwa_order.id)
    @order.add :id => @product.id, :price => @product.price, :description => @product.description, :email => current_user.email
  end

  def confirm
    return unless request.post?

    pagseguro_notification do |notification|
      if notification.valid?
        order = Order.find(notification.params['Referencia'])
        order.status = Iconv.new('ISO-8859-1','UTF-8').iconv(notification.params['StatusTransacao'])
        order.transaction_token = notification.params['TransacaoID']
        order.processed_at = notification.processed_at
        order.payment_type = Iconv.new('ISO-8859-1','UTF-8').iconv(notification.params['TipoPagamento'])
        order.paid_at = Time.now if notification.status.to_s == 'completed' or notification.status.to_s == 'approved'
        order.save
      end
    end

    render :nothing => true
  end
end
