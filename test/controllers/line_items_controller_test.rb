require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase

  test "should add line item to cart" do
    post :create, product: products(:one)
    assert_not_nil assigns(:line_item)
  end

  test "should save line item" do
    assert_difference 'LineItem.count' do
      post :create, product: products(:one)
    end
  end

  test "should create new cart if no cart exists" do
  	session[:cart_id] = nil
  	post :create, product: products(:one)
  	assert_not_nil assigns(:cart)
  	assert_equal session[:cart_id], assigns(:cart).id
  end

   test "should use cart if it exists" do
  	cart = Cart.create
  	session[:cart_id] = cart.id

  	post :create, product: products(:one)
  	assert_equal assigns(:cart).id, cart.id
  end

  test "should redirect to cart" do
    post :create, product: products(:one)
    assert_redirected_to cart_path(session[:cart_id])
  end

  test "should delete line item" do
    assert_difference 'LineItem.count', -1 do
      delete :destroy, id: line_items(:one).id
    end

    assert assigns(:line_item)
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should decrement line item with quantity greater than one" do
    put :decrement, id: line_items(:two_items).id

    assert assigns(:line_item)
    assert_equal assigns(:line_item).quantity, 1
    assert_redirected_to cart_path(assigns(:cart))
  end

end
