class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def decrement_or_destroy
    if quantity > 1
      decrement!(:quantity)
    else
      destroy
    end
  end
end
