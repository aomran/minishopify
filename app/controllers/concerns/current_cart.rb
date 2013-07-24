module CurrentCart
  extend ActiveSupport::Concern

  def set_cart
    if session[:cart_id].nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
    else
        @cart = Cart.find(session[:cart_id])
    end
  end
end