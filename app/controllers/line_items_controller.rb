class LineItemsController < ApplicationController

  def create
    @product = Product.find(params[:product])

    if session[:cart_id] == nil
    	@cart = Cart.new
    	session[:cart_id] = @cart.id
    else
    	@cart = Cart.find(session[:cart_id])
    end
    
    render nothing: true
  end
end
