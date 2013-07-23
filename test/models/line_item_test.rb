require 'test_helper'

class LineItemTest < ActiveSupport::TestCase

  test "decrement or destroy line item" do
    line_items(:two_items).decrement_or_destroy
    line_item = LineItem.find(line_items(:two_items))
    assert_equal line_item.quantity, 1
  end
end
