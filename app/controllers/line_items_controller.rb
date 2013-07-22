class LineItemsController < ApplicationController
  before_action :set_cart

  def create
    @product = Product.find(params[:product])
    @line_item = @cart.add_product(@product.id)
    @line_item.save

    redirect_to cart_path(@cart)
  end

  def set_cart
    if session[:cart_id].nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
    else
        @cart = Cart.find(session[:cart_id])
    end
  end
end
