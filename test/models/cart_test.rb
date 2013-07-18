require 'test_helper'

class CartTest < ActiveSupport::TestCase
  
  test "adds line items to cart" do
  	@cart = Cart.new
  	assert_instance_of(LineItem, @cart.add_product(1))
  end
end
