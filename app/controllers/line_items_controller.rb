class LineItemsController < ApplicationController

  def create
    @product = Product.find(params[:product])
    render nothing: true
  end
end
