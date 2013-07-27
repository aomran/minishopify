class OrdersController < ApplicationController

  include CurrentCart
  before_action :set_cart

  def new
    if @cart.line_items.empty?
      redirect_to root_url, notice: 'Your cart is empty'
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    @order.save

    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil

    OrderNotifier.received(@order).deliver
    redirect_to root_url, notice: 'Thank you for your order!'
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end

end
