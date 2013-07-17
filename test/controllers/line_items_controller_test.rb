require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  test "should find product associated with line item" do
    post :create, product: products(:one)
    assert_not_nil assigns(:product)
    # assert_difference('LineItem.count') do
    #   post :create, product_id: products(:one).id
    # end
  end
end
