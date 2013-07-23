require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "adds line items from cart" do
    order = Order.new
    order.add_line_items_from_cart(carts(:cart_with_item))
    carts(:cart_with_item).destroy
    assert order.line_items.any?, 'No Line Items associated with order'
  end
end
