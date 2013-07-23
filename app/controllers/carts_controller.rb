class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def destroy
  	@cart.destroy
  	session[:cart_id] = nil
  	redirect_to root_url, notice: "Cart emptied"
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  end
end
