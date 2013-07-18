class LineItemsController < ApplicationController

  def create
    @product = Product.find(params[:product])

    if session[:cart_id] == nil
    	@cart = Cart.new
    	session[:cart_id] = @cart.id
    else
    	@cart = Cart.find(session[:cart_id])
    end

    @line_item = @cart.add_product(@product.id)
    
    redirect_to store_index_url
  end
end
