require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test "should show a cart" do
    get :show, id: carts(:cart_without_item)
    assert_response :success
    assert_not_nil assigns(:cart)
  end

  test "should destroy a cart" do
  	assert_difference 'Cart.count', -1 do
  		delete :destroy, id: carts(:cart_without_item)
  	end

  	assert_redirected_to store_index_url
  end

  test "should remove cart_id from session" do
  	session[:cart_id] = carts(:cart_without_item).id
  	delete :destroy, id: carts(:cart_without_item)
  	
  	assert_nil session[:cart_id]
  end

end
