require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  def setup
    @order = {
      name: "Ahmed",
      address: "1234 street",
      email: "email@gg.com",
      pay_type: "Credit"
    }
  end

  test "should get new order form" do
    get :new
    assert assigns(:order)
    assert_response :success
  end

  test "should create order" do
    session[:cart_id] = carts(:cart_with_item).id
    assert_difference 'Order.count' do
      post :create, order: @order
    end
  end

  test "should destroy cart" do
    session[:cart_id] = carts(:cart_with_item).id

    assert_difference 'Cart.count', -1 do
      post :create, order: @order
    end

    assert_nil session[:cart_id]
  end

end
