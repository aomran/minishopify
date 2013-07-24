require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  def setup
    @order = {
      name: "Ahmed",
      address: "1234 street",
      email: "email@gg.com",
      pay_type: "Credit"
    }
    session[:cart_id] = carts(:cart_with_item).id
  end

  test "redirect to store-front if cart is empty" do
    session[:cart_id] = carts(:cart_without_item).id
    get :new
    assert_redirected_to root_url
  end

  test "should get new order form" do
    get :new
    assert assigns(:order)
    assert_response :success
  end

  test "should create order" do
    assert_difference 'Order.count' do
      post :create, order: @order
    end
  end

  test "should destroy cart" do

    assert_difference 'Cart.count', -1 do
      post :create, order: @order
    end

    assert_nil session[:cart_id]
  end

  test "should redirect back to store-front" do
    post :create, order: @order

    assert_redirected_to root_url
  end
end
