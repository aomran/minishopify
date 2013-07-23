class Order < ActiveRecord::Base
  has_many :line_items

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      # set id to nil so that item doesn't go poof when we delete the cart
      item.cart_id = nil

      # rails knows that order has many line_items, so it adds these items to the line_items collection for this order.
      line_items << item
    end
  end
end
