class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy]

	def index
		@products = Product.all
	end

	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to product_path(@product)
		else
			render nothing: true
		end
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to product_path(@product)
		else
			render nothing: true
		end
	end

	def destroy
		@product.destroy
		redirect_to products_path
	end

	private

	def set_product
		@product = Product.find_by_id(params[:id])
	end

	def product_params
		params.require(:product).permit(:title, :description, :image_url, :price)
	end
end
