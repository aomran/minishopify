class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :set_line_item, except: ['create']

  def create
    product = Product.find(params[:product])
    @line_item = @cart.add_product(product.id)
    @line_item.save

    redirect_to cart_path(@cart)
  end

  def destroy
    @line_item.destroy

    redirect_to cart_path(@cart), notice: 'Line item removed'
  end

  def decrement
    @line_item.decrement_or_destroy
    redirect_to cart_path(@cart), notice: 'Line item removed'
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
