class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find_by_id(params[:id])
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
		@product = Product.find_by_id(params[:id])
	end

	def update
		@product = Product.find_by_id(params[:id])
		if @product.update(product_params)
			redirect_to product_path(@product)
		else
			render nothing: true
		end
	end

	def destroy
		@product = Product.find_by_id(params[:id])
		@product.destroy
		redirect_to products_path
	end

	private
	def product_params
		params.require(:product).permit(:title, :description, :image_url, :price)
	end
end
