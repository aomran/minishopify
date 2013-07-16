require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
  	@product = {
  		title: "First Book",
  		description: "this is a book about something great",
  		image_url: "gg.gif",
  		price: 25.99
  	}

  	@updated_product = {
  		title: "First Book updated title",
  		description: "this is a book about something great",
  		image_url: "gg.gif",
  		price: 25.99
  	}
  end

  test "should get index action" do
  	get :index
  	assert_response :success
    assert_select '.entry', 2
	end

	test "should assign products in index action" do
		get :index
		assert_not_nil assigns(:products)
	end

	test "should show single product" do
		get :show, id: products(:one)
		assert_response :success
		assert_not_nil assigns(:product)
    assert_select '.title', products(:one).title
	end

	test "should get new action" do
		get :new
		assert_response :success
		assert_not_nil assigns(:product)
	end

	test "should create new product" do
		assert_difference ('Product.count') do
			post :create, product: @product
		end
	end

	test "should redirect to product after successful creation" do
		post :create, product: @product
		assert_redirected_to product_path(assigns(:product))
	end

	test "should get edit action" do
		get :edit, id: products(:one)
		assert_response :success
		assert_not_nil assigns(:product)
	end

	test "should update product" do
		patch :update, id: products(:one), product: @updated_product
		assert_redirected_to product_path(assigns(:product))
	end

	test "should delete product" do
		assert_difference('Product.count', -1) do
			delete :destroy, id: products(:one)
		end
		assert_redirected_to products_path
	end

	# work on this when I get to validations
	# test "should redirect to new action after failed creation" do
	# 	post :create, product: @product
	# 	assert_redirected_to product_path(assigns(:product))
	# end
end
