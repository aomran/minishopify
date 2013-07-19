class LineItemsController < ApplicationController

  def create
    @product = Product.find_by_id(params[:product])

    if session[:cart_id] == nil
    	@cart = Cart.create
    	session[:cart_id] = @cart.id
    else
    	@cart = Cart.find_by_id(session[:cart_id])
    end

    @line_item = @cart.add_product(@product.id)
    
    redirect_to cart_path(@cart)
  end
end
