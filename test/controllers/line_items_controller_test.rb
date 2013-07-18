require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  
  test "should find product associated with line item" do
    post :create, product: products(:one)
    assert_not_nil assigns(:product)
    # assert_difference('LineItem.count') do
    #   post :create, product_id: products(:one).id
    # end
  end

  test "should create new cart if not cart exists" do
  	session[:cart_id] = nil
  	post :create, product: products(:one)
  	assert_not_nil assigns(:cart)
  	assert_equal session[:cart_id], assigns(:cart).id
  end

   test "should use cart if it exists" do
  	cart = Cart.new
  	session[:cart_id] = cart.id
  	
  	post :create, product: products(:one)
  	assert_equal assigns(:cart).id, cart.id
  end


  test "should add line item to cart" do
    post :create, product: products(:one)
    assert_not_nil assigns(:line_item)
  end

  test "should redirect to cart" do
    post :create, product: products(:one)
    assert_redirected_to store_index_url do
      assert_select '.notice'
    end
  end

end
