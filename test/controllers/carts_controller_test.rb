require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: carts(:one)
    assert_response :success
    assert_not_nil assigns(:cart)
  end

end
