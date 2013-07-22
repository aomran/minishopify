class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
  	@cart = Cart.find(params[:id])
  	@cart.destroy
  	session[:cart_id] = nil
  	redirect_to root_url, notice: "Cart emptied"
  end
end
