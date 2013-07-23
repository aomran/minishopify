class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @cart = Cart.find(session[:cart_id])

    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    @order.save

    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil

    render nothing: true
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end

end
